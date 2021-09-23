import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'dart:convert';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState(){
  super.initState();
  loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2));
   var catalogJson= await rootBundle.loadString("assets/files/catalog.json");
   var decodeData= jsonDecode(catalogJson);
   final productsData = decodeData["products"];
   CatalogModel.items = List.from(productsData)
       .map<Item>((item) => Item.fromMap(item))
       .toList();
   setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty) ?
        ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
                item: CatalogModel.items[index],
            );
          },
        ): Center(
            child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
