import 'package:flutter/material.dart';
import 'package:woocommerce_shop/resource/constants.dart';

import 'package:woocommerce_shop/ui/cart_screen/cart_screen.dart';
import 'package:woocommerce_shop/ui/categories_screen/categories_screen.dart';
// import 'package:woocommerce_shop/ui/common/custom_container.dart';
import 'package:woocommerce_shop/ui/main_screen/main_screen.dart';
import 'package:woocommerce_shop/ui/promo_screen/promo_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int index;

  // ignore: use_key_in_widget_constructors
  const CustomBottomNavigationBar(
    this.index,
  );

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = widget.index;

    return Container(
      // height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constants.borderRadius),
          topRight: Radius.circular(Constants.borderRadius),
        ),
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Catalogue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.loyalty),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // iconSize: 22,
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
          switch (index) {
            case 0:
              Navigator.of(context).pushNamed(MainScreen.routeName);
              break;
            case 1:
              Navigator.of(context).pushNamed(CategoriesScreen.routeName);
              break;
            //not existing yet
            case 2:
              Navigator.of(context).pushNamed(PromoScreen.routeName);
              break;
            case 3:
              Navigator.of(context).pushNamed(CartScreen.routeName);
              break;
            //not existing yet
          }
        },
      ),
    );
  }
}
