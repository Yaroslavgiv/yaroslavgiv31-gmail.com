import 'package:flutter/material.dart';
import 'package:woocommerce_shop/resource/constants.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;

  const CustomContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.borderRadius),
        border: Border.all(
          color: Colors.black12,
          width: 1,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
