import 'package:flutter/material.dart';
import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/cart_screen/cart_screen.dart';
import 'package:woocommerce_shop/ui/categories_screen/categories_screen.dart';
// import 'package:woocommerce_shop/ui/common/bottom_navigation_bar.dart';
import 'package:woocommerce_shop/ui/main_screen/main_screen.dart';
import 'package:woocommerce_shop/ui/promo_screen/promo_screen.dart';

// import 'common/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List _children = const [
    MainScreen(),
    CategoriesScreen(),
    PromoScreen(),
    CartScreen(),
  ];
  DateTime _preBackPress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final timeGap = DateTime.now().difference(_preBackPress);
        final cantExit = timeGap >= const Duration(seconds: 2);
        _preBackPress = DateTime.now();
        if (cantExit) {
          const snack = SnackBar(
            content: Text(Constants.confirmExit),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: _bottomNavigationBuilder(),
      ),
    );
  }

  Widget _bottomNavigationBuilder() {
    return Container(
      // height: 30,
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
        currentIndex: _currentIndex,
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
              _currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
