// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';

class AppThemes {

  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kContentColorDarkTheme,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: kIconColorLightTheme),
          bodyText1: TextStyle(
            color: kIconColorLightTheme)
        ),
        iconTheme: const IconThemeData(
          color: kIconColorLightTheme,
          
          ),
        colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
        )),
    AppTheme.darkTheme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kContentColorLightTheme,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: kIconColorDarcTheme),
          bodyText1: TextStyle(
            color: kIconColorDarcTheme)
        ),
        iconTheme: const IconThemeData(color: kIconColorDarcTheme),
        colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
        ))
  };
}
 enum AppTheme {
  lightTheme,
   darkTheme,
 }