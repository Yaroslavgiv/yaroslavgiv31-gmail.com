import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:woocommerce/woocommerce.dart';
import 'package:provider/provider.dart';
// карточки товаров
import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/common/custom_container.dart';
import 'package:woocommerce_shop/ui/detail_product_screen/detail_product_screen.dart';

import '../../data/providers/product_provider.dart';


class ProductCard extends StatelessWidget {
  final WooProduct product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProductsProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        prov.getProductById(product.id).then(
              (value) => Navigator.of(context)
              .pushNamed(DetailProductScreen.routeName, arguments: product),
        );
      },
      child: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Flexible(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Constants.borderRadius),
                      topRight: Radius.circular(Constants.borderRadius),
                    ),
                    child: Image(
                      image: NetworkImage(product.images[0].src),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${product.price} ${Constants.currency}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const Spacer(),
                    Align(
                      alignment: Constants.alignment,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(Constants.buyButtonText),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
