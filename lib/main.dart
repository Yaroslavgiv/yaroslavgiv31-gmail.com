import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsip/tel_bloc/sipauth_bloc.dart';
import 'package:telsip/tel_bloc/dialer_cubit.dart';
import 'package:telsip/tel_bloc/sipcall_bloc.dart';
import 'package:telsip/tel_bloc/theme_bloc.dart';
import 'package:telsip/ui/call_screen.dart';
import 'package:telsip/ui/main_screen.dart';
import 'package:telsip/ui/screen/dialing_screen.dart';
import 'package:telsip/ui/screen/talk_screen.dart';
import 'linphonekotlininterface.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  linphoneKotlinInterface.instance;
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: AppBlocObserver());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SipAuthBloc()),
      BlocProvider(create: (_) => SipCallBloc()),
      BlocProvider(create: (_) => DialerCubit())
    ], child: linwrapper());
  }
}

class linwrapper extends StatelessWidget {
  const linwrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    linphoneKotlinInterface.instance.stream.listen((event) {
      print("EVENT RECEIVE: ${event.args}");

      switch (event.args["CMD_NAME"]) {
        case "onAccountRegistrationStateChanged":
          var newEvent = SipAuthEvent.factory(event.args["state"]!);
          context.read<SipAuthBloc>().add(newEvent);
          break;

        case "onCallStateChanged":
          var newEvent = SipCallEvent.factory(event.args["state"]!);
          context.read<SipCallBloc>().add(newEvent);
          break;
      }
    });

    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeState.themeData,
            // ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
            home: BlocBuilder<SipCallBloc, SipCallState>(
                builder: (context, state) {
              var curent_screen;
              switch (state) {
                case SipCallState.sipCallIdle:
                  curent_screen = const MainScreen();
                  break;
                case SipCallState.incomingReceived:
                  curent_screen = const CallScreen();
                  break;
                case SipCallState.pushIncomingReceived:

                case SipCallState.outgoingInit:
                case SipCallState.outgoingProgress:
                case SipCallState.outgoingRinging:
                case SipCallState.outgoingEarlyMedia:
                  curent_screen = const DialingScreen();
                  break;
                case SipCallState.connected:

                case SipCallState.streamsRunning:
                case SipCallState.pausing:
                case SipCallState.paused:
                case SipCallState.resuming:
                case SipCallState.referred:
                  curent_screen = const TalkScreen();
                  break;
                case SipCallState.error:
                case SipCallState.end:
                // curent_screen = CallEndScreen();
                // break;
                case SipCallState.pausedByRemote:
                case SipCallState.updatedByRemote:
                case SipCallState.incomingEarlyMedia:
                case SipCallState.updating:
                case SipCallState.released:
                case SipCallState.earlyUpdatedByRemote:
                case SipCallState.earlyUpdating:
                  curent_screen = const MainScreen();
                  break;
              }

              return curent_screen;
            }),
          );
        },
      ),
    );
  }
}
