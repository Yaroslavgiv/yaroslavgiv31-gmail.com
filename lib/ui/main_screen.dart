import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:telsip/tel_bloc/dialer_cubit.dart';
import 'package:telsip/tel_bloc/theme_bloc.dart';
import 'package:telsip/theme.dart';

import 'package:telsip/ui/settings.dart';
import 'package:telsip/widget/call_list_widget.dart';

import 'package:telsip/widget/dialer.dart';
import 'package:telsip/widget/dialogs/help_dialog.dart';
import 'package:telsip/widget/dialogs/off_connection_dialog.dart';


import 'account_settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key,}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String user = '';
  String domain = '';
  String password = '';
  bool isSwitched = true;
  bool tab = true;


  getUser()  {
    try {
      SharedPreferences.getInstance().then((prefs){
        user = prefs.getString('user') ?? "";
        domain = prefs.getString('server') ?? "";
        password = prefs.getString('password') ?? "";
        setState(() {});
      });
    } on Exception catch (e) {
      print(e);
    }

  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();
    return SafeArea(
      child: DefaultTabController(
        length: 2, //вернуть 4
        child: Builder (builder: (BuildContext context){
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if(tabController.index != 0){
              setState(() {
                tab = false;
              });
            }
            if(tabController.index == 0){
              setState(() {
                tab = true;
              });
            }
          });
          return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  TabBar(
                  padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                  tabs: [
                    Tab(icon: Icon(Icons.phone, color: Theme.of(context).iconTheme.color, size: 30.0,), ),
                    Tab(icon: Icon(Icons.access_time_sharp, color: Theme.of(context).iconTheme.color, size: 30.0,)),
                    // Tab(icon: Icon(Icons.message, color: Theme.of(context).iconTheme.color)), //вернуть
                    // Tab(icon: Icon(Icons.task, color: Theme.of(context).iconTheme.color)), //вернуть
                  ],
                ),
                 Expanded(
                  child: TabBarView(
                    children: [
                      Dialer(user: user, domain: domain,password: password, isContact: true,),
                      CallListWidget(),
                      // const Icon(Icons.directions_transit),
                      // Chats(), //вернуть
                      // const Tasks(), //вернуть
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.build_outlined, size: 20.0,),
                      onPressed: () async {
                        _getAccount(context);
                      },
                    ),
                    IconButton(
                      icon: tab? (BlocBuilder<DialerCubit, bool>(builder: (_, isDialpad) => isDialpad
                    ? Icon(Icons.import_contacts, size: 20.0,) : Image.asset('assets/images/ic_menu_switch_digit.png'))) : const SizedBox(),
                       onPressed: (){
                        context.read<DialerCubit>().toggleDialpad();
                         //Navigator.push(context, MaterialPageRoute(builder: (context) => CallEndScreen()));
                       },
                    ),
                    PopupMenuButton(
                      iconSize: 20.0,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          // textStyle:,
                          value: 1,
                          child: Text('Настройки',
                      style: Theme.of(context).textTheme.bodyText1),),
                        
                        PopupMenuItem(value: 2, child: Text('Помощь',
                      style: Theme.of(context).textTheme.bodyText1)),
                        PopupMenuItem(
                            value: 3, child: Text('Отключение соединения',
                      style: Theme.of(context).textTheme.bodyText1)),
                         PopupMenuItem(
                            value: 4,
                          child: isSwitched ? Text('Темная тема',
                      style: Theme.of(context).textTheme.bodyText1) : Text('Светлая тема',
                      style: Theme.of(context).textTheme.bodyText1),
                         ),
                      ],
                      offset: const Offset(0, -155),
                      onSelected: (value) {
                        switch (value) {
                          case 1:
                            _getSettings(context);
                            break;
                          case 2:
                            // _helpDialog(context); //вернуть
                            break;
                          case 3:
                            _offConnectionDialog(context); //вернуть
                            break;
                          case 4:
                              isSwitched = !isSwitched;
                              isSwitched ?
                              themeBloc.add(ThemeEvent(appTheme: AppTheme.lightTheme)) : themeBloc.add(ThemeEvent(appTheme: AppTheme.darkTheme));
                            break;
                          default:
                            print('Значение не выбрано');
                            break;
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      }),
      ),
    );
  }

  _getAccount(BuildContext context) async {
    Route accountRoute =
        MaterialPageRoute(builder: (context) => const AccountSettings());
    await Navigator.push(context, accountRoute);
    setState(() {
      getUser();
    });
  }

  _getSettings(BuildContext context) async {
    Route settingRoute =
        MaterialPageRoute(builder: (context) => const Settings());
    await Navigator.push(context, settingRoute);
  }

  _offConnectionDialog(BuildContext context) {
    return offConnectionDialog(context);
  }

  _helpDialog(BuildContext context) {
    return helpDialog(context);
  }


}
