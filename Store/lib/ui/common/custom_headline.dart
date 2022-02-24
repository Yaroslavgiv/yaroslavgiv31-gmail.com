import 'package:flutter/material.dart';
import 'package:woocommerce_shop/resource/constants.dart';

class CustomHeadline extends StatelessWidget {
  final String text;

  const CustomHeadline({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Constants.alignment,
        child: Text(text, style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
