import 'package:flutter/material.dart';
// import 'package:woocommerce/woocommerce.dart';
import 'package:provider/provider.dart';
// боковое меню
import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/catalogue_screen/catalogue_screen.dart';
// import 'package:woocommerce_shop/ui/categories_screen/categories_screen.dart';
import 'package:woocommerce_shop/ui/main_screen/main_screen.dart';

import '../../data/providers/product_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProductsProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    Constants.companyTitle,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    Constants.companySlogan,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(MainScreen.routeName),
                child: Text(Constants.goToMain,
                    style: Theme.of(context).textTheme.headline3)),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
                iconColor: Theme.of(context).primaryColor,
                title: Text(
                  Constants.catalogue,
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: prov.categories.map((cat) {
                  return SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Text(cat.name,
                          style: Theme.of(context).textTheme.headline6),
                      onTap: () {
                        prov.getProductsByCategoryId(cat.id.toString()).then(
                              (value) => Navigator.of(context).pushNamed(
                                  CatalogueScreen.routeName,
                                  arguments: cat),
                            );
                      },
                    ),
                  );
                }).toList()),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(Constants.contacts,
                style: Theme.of(context).textTheme.headline3),
            onTap: () {},
          ),
          ListTile(
            title: Text(Constants.about,
                style: Theme.of(context).textTheme.headline3),
            onTap: () {},
          ),
        ],
      ),
    );
  }
} // боковая панель
