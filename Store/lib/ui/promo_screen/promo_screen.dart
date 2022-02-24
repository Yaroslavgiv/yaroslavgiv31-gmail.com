import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woocommerce_shop/data/providers/product_provider.dart';
import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/catalogue_screen/product_card.dart';
// import 'package:woocommerce_shop/ui/common/bottom_navigation_bar.dart';
import 'package:woocommerce_shop/ui/common/custom_headline.dart';
import 'package:woocommerce_shop/ui/common/custom_padding.dart';
import 'package:woocommerce_shop/ui/common/drawer.dart';
import 'package:woocommerce_shop/ui/main_screen/image_carousel_promo.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  static const routeName = '/promo';

  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  List<String> carouselImages = [
    "https://ychef.files.bbci.co.uk/976x549/p07ryyyj.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl5TaexXMOe8wGn-RkRmdT7q7Fia_3Z8k10w&usqp=CAU",
    "https://www.mythirtyspot.com/wp-content/uploads/2014/09/Screen-Shot-2014-09-18-at-10.19.29-PM-1024x712.png",
  ];

  @override
  void initState() {
    super.initState();
    var prov = Provider.of<ProductsProvider>(context, listen: false);
    prov.categoryById = prov.promoCategory;
    prov.getProductsByCategoryId(prov.promoCategory.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.companyTitle.toUpperCase()),
      ),
      drawer: const CustomDrawer(),
      body: CustomPadding(
        child: ListView(
          children: [
            CustomHeadline(text: prov.categoryById.name),
            ImageCarouselPromo(list: carouselImages),
            const SizedBox(height: 30),
            GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: Constants.productsCrossAxisCount,
              crossAxisSpacing: Constants.productsCrossAxisSpacing,
              mainAxisSpacing: Constants.productsMainAxisSpacing,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1.5,
              children: List.generate(
                prov.categoryProducts.length,
                (index) {
                  return ProductCard(product: prov.categoryProducts[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
