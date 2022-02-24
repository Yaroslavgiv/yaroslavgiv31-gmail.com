import 'package:flutter/material.dart';
import 'package:telsip/linphonekotlininterface.dart';

class DialingScreen extends StatefulWidget {
  const DialingScreen({Key? key}) : super(key: key);

  @override
  _DialingScreenState createState() => _DialingScreenState();
}

class _DialingScreenState extends State<DialingScreen> {
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
                        child: const Text('НАБОР НОМЕРА',
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
                      bottom: BorderSide(color: Colors.white, width: 2),
                    ),
                    color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: Image.asset('assets/images/ic_ab_dialpad.png'),
                        color: Colors.white70,
                        onPressed: () {},
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.info_outline_rounded),
                      color: Colors.white70,
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: const Icon(Icons.more_vert),
                        color: Colors.white70,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: InkWell(
                onTap: ()=> linphoneKotlinInterface.instance.hangup_call(<String,String>{}),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2),
                      ),
                      color: Colors.red),
                  child: Center(
                    child: Image.asset(
                      'assets/images/ic_end_call.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              flex: 4,
            ),
            Container(height: 60, color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/ic_sound_speakerphone_holo_dark.png'),
                  color: Colors.white70,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/images/ic_micro_dark.png'),
                  color: Colors.white70,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.build_outlined),
                  color: Colors.white70,
                  onPressed: () {},
                ),
              ],
              ),),
          ],
        ),
      ),
    );
  }
}
