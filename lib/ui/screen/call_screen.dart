import 'package:flutter/material.dart';
import 'package:telsip/linphonekotlininterface.dart';
import '../../widget/incoming_call_button.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.black),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/ic_contact_picture_180_holo_light.png",
                      fit: BoxFit.fill,
                      width: size.width,
                      height: size.height,
                    ),
                    Container(
                        width: size.width * 1,
                        height: size.height * 0.1,
                        color: Colors.grey.withOpacity(0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                '7214',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'SIP/7212 : 7214',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                      top: size.height * 0.1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 1,
                        height: size.height * 0.03,
                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 1),
                            ),
                            color: Color.fromRGBO(18, 100, 125, 0.8)),
                        child: const Text('ВХОДЯЩИЙ ВЫЗОВ...',
                            style: TextStyle(fontSize: 13)),
                        padding: EdgeInsets.only(right: 5),
                      ),
                    )
                  ],
                ),
              ),
              flex: 8,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.white, width: 2),
                      bottom: BorderSide(color: Colors.white, width: 2),
                      right: BorderSide(color: Colors.white, width: 2),
                    ),
                    color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.info_outline_rounded),
                      color: Colors.white70,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      color: Colors.white70,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: InComingCallButton(
                onAccept: () => linphoneKotlinInterface.instance
                    .answer_incoming_call(<String, String>{}),
                onHangup: () => linphoneKotlinInterface.instance
                    .hangup_call(<String, String>{}),
              ),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}

