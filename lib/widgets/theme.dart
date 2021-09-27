import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      buttonColor: darkBluish,
      cardColor: creamColor,
      primarySwatch: Colors.deepPurple,
      secondaryHeaderColor: darkBluish,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        textTheme: Theme.of(context).textTheme.copyWith(headline6: context
            .textTheme.headline6!.copyWith(color: Colors.black)),
        color: Colors.white,
        elevation: 0.0,
      iconTheme: IconThemeData(color: CupertinoColors.black),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      secondaryHeaderColor: Colors.white,
      backgroundColor: darkCream,
      cardColor: Colors.black,
      canvasColor: darkCream,
      buttonColor: lightBluish,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        textTheme: Theme.of(context).textTheme.copyWith(headline6: context
            .textTheme.headline6!.copyWith(color: Colors.white)),
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: CupertinoColors.white),
      ));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58);
  static Color darkCream = Vx.gray900;
  static Color lightBluish = Vx.indigo500;

}