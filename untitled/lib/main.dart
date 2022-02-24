import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/pages/home_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Intelligence',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.openSansCondensedTextTheme(
          Theme
              .of(context)
              .textTheme,
        ),

      ),
      home: HomePage(),
    );


  }
}


