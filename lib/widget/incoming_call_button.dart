import 'package:flutter/material.dart';

class InComingCallButton extends StatefulWidget {
  const InComingCallButton({Key? key, required this.onAccept, required this.onHangup}) : super(key: key);

  final Function onAccept;
  final Function onHangup;

  @override
  _InComingCallButtonState createState() => _InComingCallButtonState();
}

class _InComingCallButtonState extends State<InComingCallButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DragTarget(
            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) =>
                Image.asset("assets/images/ic_in_call_touch_end.png",
                    width: 50, height: 50),
            onAccept: (obj) => widget.onHangup(),

          ),
          Draggable(
            axis: Axis.horizontal,
              data: 0,
              dragAnchorStrategy: (Draggable<Object> draggable,
                  BuildContext context, Offset position) {
                return Offset(50, 50);
              },
              child: Image.asset(
                  "assets/images/ic_in_call_touch_handle_normal.png",
                  width: 100,
                  height: 100),
              childWhenDragging: Container(),
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
                Image.asset("assets/images/ic_in_call_touch_answer.png",
                    width: 50, height: 50),
            onAccept: (obj) => widget.onAccept(),

          ),
        ],
      ),
    );
  }
}
