import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: Theme.of(context).textTheme.copyWith(headline6: context
            .textTheme.headline6!.copyWith(color: Colors.black)),
        color: Colors.black,
        elevation: 0.0,
      ),
      primaryColor: darkBluish, //buttonColor is depreciated that's why i use primary color
      primarySwatch: Colors.deepPurple,
      secondaryHeaderColor: darkBluish,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: creamColor,
      iconTheme: IconThemeData(color: CupertinoColors.black),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    appBarTheme: AppBarTheme(
      textTheme: Theme.of(context).textTheme.copyWith(headline6: context
          .textTheme.headline6!.copyWith(color: Colors.white)),
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: CupertinoColors.white),
    ),
      primaryColor: darkBluish, //This is used for Button color as Button Color is depreciated
      secondaryHeaderColor: Colors.white,
      backgroundColor: darkCream,
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCream,
      fontFamily: GoogleFonts.poppins().fontFamily,
     );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58);
  static Color darkCream = Vx.gray900;
  static Color lightBluish = Vx.indigo500;

}