import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce_shop/data/providers/cart_provider.dart';
import 'package:woocommerce_shop/data/repository.dart';

import 'package:woocommerce_shop/resource/constants.dart';
import 'package:woocommerce_shop/ui/cart_screen/cart_screen.dart';
import 'package:woocommerce_shop/ui/catalogue_screen/catalogue_screen.dart';
import 'package:woocommerce_shop/ui/categories_screen/categories_screen.dart';
import 'package:woocommerce_shop/ui/detail_product_screen/detail_product_screen.dart';
import 'package:woocommerce_shop/ui/home.dart';
import 'package:woocommerce_shop/ui/main_screen/main_screen.dart';
import 'package:woocommerce_shop/data/providers/product_provider.dart';
import 'package:woocommerce_shop/ui/promo_screen/promo_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProductsProvider(Repository())),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primaryColor: const Color(0xff5c4b5c),
        primaryColorLight: const Color(0xffb1a8b0),
        primaryColorDark: const Color(0xff4a3749),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        // scaffoldBackgroundColor: const Color(0xfff5f5f5),
        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xff5c4b5c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          height: 80,
          padding: const EdgeInsets.all(10),
        ),
        // backgroundColor: const Color(0xfff5f5f5),
        // bottomNavigationBarTheme: ,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xff4a3749),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.75,
          ),
          headline2: TextStyle(
            color: Color(0xffffffff),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.75,
          ),
          headline3: TextStyle(
            color: Color(0x8A000000),
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.75,
          ),
          headline4: TextStyle(
            color: Color(0xff4a3749),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.75,
          ),
          headline5: TextStyle(
            color: Color(0xffffffff),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.75,
          ),
          headline6: TextStyle(
            color: Color(0x8A000000),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.75,
          ),
          bodyText1: TextStyle(
              color: Color(0xff000000), letterSpacing: 0.75, height: 1.2),
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.all<Color>(
        //         Theme.of(context).primaryColor),
        //   ),
        // ),
        appBarTheme: const AppBarTheme(
          color: Color(0xff5c4b5c),
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Color(0xffffffff),
          ),
        ),
      ),
      home: const Home(),
      routes: {
        CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
        CatalogueScreen.routeName: (ctx) => const CatalogueScreen(),
        DetailProductScreen.routeName: (ctx) => const DetailProductScreen(),
        PromoScreen.routeName: (ctx) => const PromoScreen(),
        CartScreen.routeName: (ctx) => const CartScreen(),
      },
    );
  }
}
