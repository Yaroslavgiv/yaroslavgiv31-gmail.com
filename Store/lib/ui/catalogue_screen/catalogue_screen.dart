import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:woocommerce/woocommerce.dart';
import 'package:provider/provider.dart';
// окно с карточками товара
import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/common/custom_headline.dart';
import 'package:woocommerce_shop/ui/common/custom_padding.dart';
import 'package:woocommerce_shop/ui/common/drawer.dart';
import 'package:woocommerce_shop/ui/catalogue_screen/product_card.dart';

import '../../data/providers/product_provider.dart';

class CatalogueScreen extends StatefulWidget {
  // final String categoryTitle;
  const CatalogueScreen({Key? key
      // , required this.categoryTitle
      })
      : super(key: key);

  static const routeName = '/catalogue';

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProductsProvider>(context, listen: false);
    final WooProductCategory? cat =
        ModalRoute.of(context)!.settings.arguments as WooProductCategory;


    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.companyTitle.toUpperCase()),
        // leading: BackButton(
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      drawer: const CustomDrawer(),
      body: CustomPadding(
        child: ListView(
          children: [
            CustomHeadline(text: cat!.name),
            GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: Constants.productsCrossAxisCount,
              crossAxisSpacing: Constants.productsCrossAxisSpacing,
              mainAxisSpacing: Constants.productsMainAxisSpacing,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 2,
              children: List.generate(
                prov.categoryProducts.length,
                (index) {
                  return ProductCard(product: prov.categoryProducts[index]);
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
