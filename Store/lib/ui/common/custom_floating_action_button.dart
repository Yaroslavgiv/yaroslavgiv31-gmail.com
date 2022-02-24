import 'package:flutter/material.dart';
import 'package:woocommerce_shop/resource/constants.dart';
// import 'package:woocommerce_shop/ui/cart_screen/cart_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomFloatingActionButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 270,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        //ToDo: What should happen on button pressed in the UI?
        backgroundColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Constants.borderRadius),
          ),
        ),
        label: Row(
          children: [
            Text(
              Constants.buyButtonText,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.shopping_bag_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
