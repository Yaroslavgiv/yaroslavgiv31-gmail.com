import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce_shop/data/providers/cart_provider.dart';

// корзина
import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/cart_screen/cart.dart';
import 'package:woocommerce_shop/ui/cart_screen/widgets/cart_item_card.dart';
import 'package:woocommerce_shop/ui/common/custom_headline.dart';
import 'package:woocommerce_shop/ui/common/custom_padding.dart';
import 'package:woocommerce_shop/ui/common/drawer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.companyTitle.toUpperCase()),
      ),
      drawer: const CustomDrawer(),
      body: CustomPadding(
        child: ListView(
          children: <Widget>[
            const CustomHeadline(text: Constants.cart),
            ListView.builder(
              itemCount: prov.cartProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return CartItemCard(
                  cartItem: prov.cartProducts[index],
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            Text(
              'Итого: ${prov.totalSum} Руб',
              style: Theme.of(context).textTheme.headline1,
            ),
            Container(
              child: ElevatedButton(
                child: Text("Оформить заказ"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenTwo()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} // корзина
