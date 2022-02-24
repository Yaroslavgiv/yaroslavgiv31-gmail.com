import 'package:flutter/material.dart';

class CallEndScreen extends StatefulWidget {
  const CallEndScreen({Key? key}) : super(key: key);

  @override
  _CallEndScreenState createState() => _CallEndScreenState();
}

class _CallEndScreenState extends State<CallEndScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2)),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/ic_contact_picture_180_holo_light.png",
                      fit: BoxFit.fill,
                      width: size.width,
                      height: size.height,),
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
                              child: Text('7214',style: TextStyle(fontSize: 20),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('SIP/7212 : 7214',style: TextStyle(fontSize: 14),),
                            ),
                          ],
                        )),
                    Positioned(
                      top:size.height * 0.1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 1,
                        height: size.height * 0.03,
                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white,width: 1),
                            ), color: Color.fromRGBO(18, 100, 125, 0.8)),
                        child: const Text('ВЫЗОВ ЗАВЕРШЕН',
                            style: TextStyle(fontSize: 13)), padding: EdgeInsets.only(right: 5),),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width,
                        height: 50,
                        color: Colors.black,),
                    ),
                  ],
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}
