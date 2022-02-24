import 'package:flutter/material.dart';
// import 'package:woocommerce/woocommerce.dart';
import 'package:provider/provider.dart';

import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/catalogue_screen/catalogue_screen.dart';
import 'package:woocommerce_shop/ui/catalogue_screen/product_card.dart';
import 'package:woocommerce_shop/ui/categories_screen/categories_screen.dart';
// import 'package:woocommerce_shop/ui/common/bottom_navigation_bar.dart';
import 'package:woocommerce_shop/ui/common/category_card.dart';
// import 'package:woocommerce_shop/ui/common/custom_container.dart';
import 'package:woocommerce_shop/ui/common/custom_headline.dart';
import 'package:woocommerce_shop/ui/common/custom_padding.dart';
import 'package:woocommerce_shop/ui/common/drawer.dart';
import 'package:woocommerce_shop/ui/main_screen/image_carousel_promo.dart';

import '../../data/providers/product_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> carouselImages = [
    "https://ychef.files.bbci.co.uk/976x549/p07ryyyj.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl5TaexXMOe8wGn-RkRmdT7q7Fia_3Z8k10w&usqp=CAU",
    "https://www.mythirtyspot.com/wp-content/uploads/2014/09/Screen-Shot-2014-09-18-at-10.19.29-PM-1024x712.png",
  ];

  @override
  void initState() {
    super.initState();
    var prov = Provider.of<ProductsProvider>(context, listen: false);
    prov.getProductCategories().then(
          (value) =>
              prov.getProductsByCategoryId(prov.promoCategory.id.toString()),
        );
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.companyTitle.toUpperCase()),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ImageCarouselPromo(list: carouselImages),
          const SizedBox(height: 10),
          CustomPadding(
            child: Column(
              children: [
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(CategoriesScreen.routeName),
                  child: const CustomHeadline(text: Constants.categories),
                ),
                GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: Constants.categoriesCrossAxisCount,
                  crossAxisSpacing: Constants.categoriesCrossAxisSpacing,
                  mainAxisSpacing: Constants.categoriesMainAxisSpacing,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // childAspectRatio: 1 / 1,
                  children: List.generate(
                    prov.categoriesWithoutPromo.length,
                    (index) {
                      return CategoryCard(
                          category: prov.categoriesWithoutPromo[index]);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => {
                    prov
                        .getProductsByCategoryId(prov.promoCategory.id.toString())
                        .then(
                          (value) => Navigator.of(context).pushNamed(
                            CatalogueScreen.routeName,
                            arguments: prov.promoCategory,
                          ),
                        ),
                  },
                  child: const CustomHeadline(text: Constants.promo),
                ),
                GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: Constants.promoCrossAxisCount,
                  crossAxisSpacing: Constants.promoCrossAxisSpacing,
                  mainAxisSpacing: Constants.promoMainAxisSpacing,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    prov.categoryProducts.length,
                    (index) {
                      return ProductCard(product: prov.categoryProducts[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
