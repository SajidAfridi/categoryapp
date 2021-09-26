import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      secondaryHeaderColor: darkBluish,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      textTheme: Theme.of(context).textTheme,
      iconTheme: IconThemeData(color: CupertinoColors.black),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      secondaryHeaderColor: Colors.white,
      backgroundColor: DarkcreamColor,
      cardColor: Colors.black45,
      canvasColor: DarkcreamColor,
      buttonColor: lightBluish,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        textTheme: Theme.of(context).textTheme,
        iconTheme: IconThemeData(color: CupertinoColors.white),
      ));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58);
  static Color DarkcreamColor = Vx.gray900;
  static Color lightBluish = Vx.indigo500;

}