import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home.dart';
import 'package:flutter_catalog/pages/login.dart';
import 'package:flutter_catalog/util/route.dart';
import 'package:flutter_catalog/widgets/themChanger.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'flutter_auth/signUp.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (BuildContext context, ThemeMode themeMode)
      {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: MyTheme.lightTheme(context),
            darkTheme: MyTheme.darkTheme(context),
            initialRoute: MyRoute.logInRoute,
            routes: {
              MyRoute.homeRoute: (context)=> Home(userEmail: null,),
              MyRoute.logInRoute: (context)=> LogIn(),
              MyRoute.cartRoute: (context)=> CartPage(),
              MyRoute.registerRoute: (context)=> Register(),
            },
        );
      },

    );
  }
}