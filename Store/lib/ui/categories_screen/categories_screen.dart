import 'package:flutter/material.dart';

// import 'package:woocommerce/woocommerce.dart';
import 'package:provider/provider.dart';

import 'package:woocommerce_shop/resource/constants.dart';

// import 'package:woocommerce_shop/ui/common/bottom_navigation_bar.dart';
import 'package:woocommerce_shop/ui/common/category_card.dart';
import 'package:woocommerce_shop/ui/common/custom_headline.dart';
import 'package:woocommerce_shop/ui/common/custom_padding.dart';
import 'package:woocommerce_shop/ui/common/drawer.dart';

import '../../data/providers/product_provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const routeName = '/categories';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    var prov = Provider.of<ProductsProvider>(context, listen: false);
    prov.getProductCategories();
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
            const CustomHeadline(text: Constants.categories),
            GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: Constants.categoriesCrossAxisCount,
              crossAxisSpacing: Constants.categoriesCrossAxisSpacing,
              mainAxisSpacing: Constants.categoriesMainAxisSpacing,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                prov.categories.length,
                (index) {
                  return CategoryCard(category: prov.categories[index]);
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
