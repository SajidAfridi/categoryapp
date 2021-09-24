import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: Theme.of(context).textTheme,
      iconTheme: IconThemeData(color: CupertinoColors.black),
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
    );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58);

}