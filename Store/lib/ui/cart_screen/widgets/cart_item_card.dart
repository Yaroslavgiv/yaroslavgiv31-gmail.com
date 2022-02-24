import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woocommerce_shop/data/providers/cart_provider.dart';
import 'package:woocommerce_shop/domain/cart_item.dart';
import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/common/custom_container.dart';
import 'package:woocommerce_shop/ui/common/quantity_counter.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;

  const CartItemCard({Key? key, required this.cartItem}) : super(key: key);

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    var cartProv = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CustomContainer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cartItem.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    //ToDo: add options
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${widget.cartItem.product.price} ${Constants.currency}'),
                        QuantityCounter(
                            onMinusPressed: () {
                              cartProv.removeProductFromCart(
                                  widget.cartItem.product, 1);
                            },
                            onPlusPressed: () {
                              cartProv.addProductToCart(
                                  widget.cartItem.product, 1);
                            },
                            quantity: widget.cartItem.quantity),
                      ],
                    ),
                    // const SizedBox(height: 50),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Image.network(
                  widget.cartItem.product.images[0].src,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
