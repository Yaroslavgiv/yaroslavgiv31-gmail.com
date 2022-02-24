import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:woocommerce/woocommerce.dart';
import 'package:provider/provider.dart';

import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/catalogue_screen/catalogue_screen.dart';
import 'package:woocommerce_shop/ui/common/custom_container.dart';

import '../../data/providers/product_provider.dart';

class CategoryCard extends StatelessWidget {
  final WooProductCategory category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProductsProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        prov.getProductsByCategoryId(category.id.toString()).then(
              (value) => Navigator.of(context)
                  .pushNamed(CatalogueScreen.routeName, arguments: category),
            );
      },
      child: CustomContainer(
        child: Stack(
          alignment: Constants.alignment,
          children: [
            AspectRatio(
              aspectRatio: 1 / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Constants.borderRadius),
                child: Image(
                  image: NetworkImage(
                    (category.image != null)
                        ? category.image.src
                        : "https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?format=jpg&quality=90&v=1530129081",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(Constants.borderRadius),
                      bottomRight: Radius.circular(Constants.borderRadius),
                    ),
                  ),
                  width: 300,
                  padding: const EdgeInsets.all(5),
                  //ToDo: correct horizontal padding
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
