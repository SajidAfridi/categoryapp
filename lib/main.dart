import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home.dart';
import 'package:flutter_catalog/pages/login.dart';
import 'package:flutter_catalog/util/route.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoute.homeRoute,
     routes: {
        "/": (context)=> LogIn(),
        MyRoute.homeRoute: (context)=> Home(),
       MyRoute.logInRoute: (context)=> LogIn(),
       MyRoute.cartRoute: (context)=> CartPage(),
     },
    );
  }
}