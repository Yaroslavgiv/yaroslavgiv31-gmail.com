import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:telsip/linphonekotlininterface.dart';
import 'package:telsip/tel_bloc/dialer_cubit.dart';
import 'package:telsip/tel_bloc/sipauth_bloc.dart';
import 'package:telsip/widget/contact_list_widget.dart';

class Dialer extends StatefulWidget {
  final String user;
  final String domain;
  final String password;
  bool isContact;

  Dialer(
      {Key? key,
      required this.user,
      required this.domain,
      required this.password,
      required this.isContact})
      : super(key: key);

  @override
  _DialerState createState() => _DialerState();
}

class _DialerState extends State<Dialer> {
  final _numberController = TextEditingController();
  bool indicator = false;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: const BoxConstraints(maxHeight: 90),
              width: _screenWidth * 0.75,
              height: _screenHeight * 0.2,
              child: SingleChildScrollView(
                reverse: true,
                child: TextFormField(
                  controller: _numberController,
                  maxLines: null,
                  enabled: false,
                  keyboardType: TextInputType.none,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 40, color: Colors.lightBlueAccent),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  // controller: _textController,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      if (widget.user != '') {
                        if (context.read<SipAuthBloc>().state ==
                            SipAuthState.none) {
                          linphoneKotlinInterface.instance
                              .launch_core({
                            'domain': widget.domain,
                            'login': widget.user,
                            'password': widget.password,
                          });
                        } else {
                          linphoneKotlinInterface.instance.stop_service({});
                        }
                      }
                    },
                    child: Image.asset(
                      "assets/images/ic_launcher_phone.png",
                      width: _screenWidth * 0.15,
                      height: _screenHeight * 0.1,
                    ),
                  ),
                ),
                Text(
                  widget.user,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
        
                BlocBuilder<SipAuthBloc, SipAuthState>(
                  builder: (_, sipState) {
                    late String picPath;
                    switch (sipState) {
                      case SipAuthState.progress:
                        picPath = "assets/images/ic_indicator_yellow.png";
                        break;
                      case SipAuthState.ok:
                        picPath = "assets/images/ic_indicator_on.png";
                        break;
                      case SipAuthState.failed:
                        picPath = "assets/images/ic_indicator_red.png";
                        break;
        
                      default:
                        picPath = "assets/images/ic_indicator_off.png";
                    }
        
                    return Image.asset(
                      picPath,
                      width: 50,
                    );
                  },
                ),
                // Icon(Icons.confirmation_num_rounded),
                // Icon(Icons.check_box_rounded),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1.5),
        child: Column(
          children: [
            BlocBuilder<DialerCubit, bool>(
                builder: (_, isDialpad) => isDialpad
                    ? dialPad(_numberController, _screenWidth)
                    : const FlutterContactsWidget()),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                color: Theme.of(context).iconTheme.color,
                thickness: 2,
                height: _screenHeight * 0.05,
                
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: TextButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.transparent),
                    onPressed: () {
                      if (_numberController.text.isNotEmpty) {
                        var num = _numberController.text;
                        // var remouteAddress =
                        //     "sip:$num@192.168.12.100";
                        linphoneKotlinInterface.instance
                            .make_call(<String, String>{
                          'remoteaddress': num,
                        });
                        _numberController.clear();
                      }
                    },
                    child: Image.asset(
                      "assets/images/ic_dial_action_call_new.png",
                      width: _screenWidth * 0.15,
                      height: _screenHeight * 0.05,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: _screenWidth * 0.02, top: _screenWidth * 0.02),
                  child: TextButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.transparent),
                    onPressed: () {
                      if (_numberController.text.isNotEmpty) {
                        _numberController.text = _numberController.text
                            .substring(0, _numberController.text.length - 1);
                      }
                    },
                    onLongPress: () {
                      _numberController.clear();
                    },
                    child: Image.asset(
                      "assets/images/ic_dial_action_delete_new.png",
                      width: _screenWidth * 0.08,
                      height: _screenHeight * 0.08,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
  }
}

Widget dialPad(TextEditingController _numberController, double _screenWidth) {
  return Column(    
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '1';
            },
            child: Image.asset(
              "assets/images/dial_num_1_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '2';
            },
            child: Image.asset(
              "assets/images/dial_num_2_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '3';
            },
            child: Image.asset(
              "assets/images/dial_num_3_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '4';
            },
            child: Image.asset(
              "assets/images/dial_num_4_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            child: Image.asset(
              "assets/images/dial_num_5_wht.png",
              width: _screenWidth * 0.28,
            ),
            onPressed: () {
              _numberController.text += '5';
            },
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '6';
            },
            child: Image.asset(
              "assets/images/dial_num_6_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '7';
            },
            child: Image.asset(
              "assets/images/dial_num_7_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '8';
            },
            child: Image.asset(
              "assets/images/dial_num_8_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '9';
            },
            child: Image.asset(
              "assets/images/dial_num_9_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '*';
            },
            child: Image.asset(
              "assets/images/dial_num_star_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '0';
            },
            onLongPress: () {
              _numberController.text += '+';
            },
            child: Image.asset(
              "assets/images/dial_num_0_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {
              _numberController.text += '#';
            },
            child: Image.asset(
              "assets/images/dial_num_pound_wht.png",
              width: _screenWidth * 0.28,
            ),
          ),
        ],
      ),
    ],
  );
}
