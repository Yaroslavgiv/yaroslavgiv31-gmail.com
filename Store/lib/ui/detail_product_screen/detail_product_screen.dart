import 'package:flutter/material.dart';
// import 'package:woocommerce/woocommerce.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce_shop/data/providers/cart_provider.dart';

import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/cart_screen/cart_screen.dart';
import 'package:woocommerce_shop/ui/common/custom_floating_action_button.dart';
// import 'package:woocommerce_shop/ui/common/custom_headline.dart';
import 'package:woocommerce_shop/ui/common/custom_padding.dart';
import 'package:woocommerce_shop/ui/common/drawer.dart';
import 'package:woocommerce_shop/ui/common/quantity_counter.dart';
import 'package:woocommerce_shop/ui/detail_product_screen/image_carousel_product.dart';
// import 'package:woocommerce_shop/ui/main_screen/image_carousel_promo.dart';

import '../../data/providers/product_provider.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  static const routeName = '/detail';

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  List<String> colorOptions = [
    "0xffB2A39D",
    "0xffE4B34C",
    "0xff9A9E9F",
  ];

  @override
  Widget build(BuildContext context) {
    var prodProv = Provider.of<ProductsProvider>(context);
    var cartProv = Provider.of<CartProvider>(context);

    String removeAllHtmlTags(String htmlText) {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

      return htmlText.replaceAll(exp, '');
    }

    final String description = removeAllHtmlTags(prodProv.product.description);

    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.companyTitle.toUpperCase()),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ImageCarouselProduct(
            list: prodProv.product.images.map((e) => e.src).toList(),
          ),
          // Image.network(prov.product.images[0].src),
          // ImageCarousel(
          //   list: prov.product.images.map((image) => image.src).toList(),
          // ),
          const SizedBox(height: 20),
          CustomPadding(
            child: Column(
              children: [
                Text(
                  prodProv.product.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "${prodProv.product.price} ${Constants.currency}",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Constants.quantityOptions,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        QuantityCounter(
                          onMinusPressed: () {},
                          onPlusPressed: () {},
                          quantity: 1,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Constants.colorOptions,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: colorOptions.map(
                              (String hex) {
                                return _colorAvatarBuilder(hex);
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          cartProv.addProductToCart(prodProv.product, 1);
          Navigator.of(context).pushNamed(CartScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget _colorAvatarBuilder(stringColor) {
  return Container(
    width: 25,
    height: 25,
    margin: const EdgeInsets.only(
      right: 6,
    ),
    decoration: BoxDecoration(
      color: Color(
        int.parse(
          stringColor,
        ),
      ),
      shape: BoxShape.circle,
    ),
  );
}
