import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/util/route.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/themChanger.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'dart:convert';
import'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.userEmail}) : super(key: key);
  final User? userEmail;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }


  moveToLogIn(BuildContext context)async {
      await Navigator.pushNamed(context, MyRoute.logInRoute);
    }


  List<bool> _selections = List.generate(
      1, (_)=>false);

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    final productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        iconTheme: Theme.of(context).iconTheme,
        actions: [
              ToggleButtons(
                isSelected: _selections,
                children: [
                  Icon(Icons.wb_sunny),
                ],
                onPressed: (int index){
                  setState(() {
                    ThemeBuilder.of(context)!.changeTheme();
                    _selections[index] = !_selections[index];
                  });
                },
                color: Vx.white,
                selectedColor: Vx.black,
              ).px20(),

          ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => moveToLogIn(context)));
              },
              child: Text("Sign Out"),
          ),

              ],
            ),
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) {
          return FloatingActionButton(
            backgroundColor: MyTheme.darkBluish,
            onPressed: () => Navigator.pushNamed(context, MyRoute.cartRoute),
            child: Icon(CupertinoIcons.cart, color: Colors.white),
          ).badge(color: Vx.red500,size: 22,count: _cart.items.length, textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ));
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items.isNotEmpty)
                  CatalogList().py16().px4().expand()
              else
                  Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(userEmail: widget.userEmail,),
    );
  }
}


