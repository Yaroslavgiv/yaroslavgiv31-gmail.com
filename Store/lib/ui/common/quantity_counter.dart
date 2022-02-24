import 'package:flutter/material.dart';

class QuantityCounter extends StatefulWidget {
  final void Function() onMinusPressed;
  final void Function() onPlusPressed;
  final int quantity;

  const QuantityCounter(
      {Key? key,
      required this.quantity,
      required this.onMinusPressed,
      required this.onPlusPressed})
      : super(key: key);

  @override
  _QuantityCounterState createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onMinusPressed,
          child: _quantityBarTileBuilder(context, '-'),
        ),
        //ToDo: Should we ask whether to delete card if removing the last item?
        _quantityBarTileBuilder(
          context,
          "${widget.quantity}",
        ),
        GestureDetector(
          onTap: widget.onPlusPressed,
          child: _quantityBarTileBuilder(context, '+'),
        ),
        Container(),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 32,
          height: 32,
          padding: const EdgeInsets.all(0),
          color: const Color(0xffEFF0F6),
          child: IconButton(
            onPressed: () {},
            icon:  const Icon(
              Icons.delete_forever,
              size: 18,
            ),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}

Widget _quantityBarTileBuilder(
  final BuildContext context,
  final String text,
) {
  return Container(
    width: 32,
    height: 32,
    // color: const Color(0xffEFF0F6),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black12,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}
