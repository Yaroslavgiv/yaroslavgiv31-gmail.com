import 'package:flutter/cupertino.dart';


class flutterHandset extends StatelessWidget {
  const flutterHandset(
      {Key? key, required this.onAccept, required this.onHangup})
      : super(key: key);
  final Function onAccept;
  final Function onHangup;


  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DragTarget(
            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) =>
                Image.asset("assets/images/ic_lockscreen_decline_normal.png",
                    width: 50, height: 50),
            onAccept: (obj) => onHangup(),
          ),
          Draggable(
              data: 0,
              dragAnchorStrategy: (Draggable<Object> draggable,
                  BuildContext context, Offset position) {
                return Offset(50, 50);
              },
              childWhenDragging: Container(width: 100, height: 100),
              child: Image.asset(
                  "assets/images/ic_in_call_touch_handle_normal.png",
                  width: 100,
                  height: 100),
              feedback: Image.asset(
                  "assets/images/ic_in_call_touch_handle_normal.png",
                  width: 100,
                  height: 100)),
          DragTarget(
            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) =>
                Image.asset("assets/images/ic_lockscreen_answer_normal.png",
                    width: 50, height: 50),
            onAccept: (obj) => onAccept(),

          ),
        ],
      ),
    );
  }
}
