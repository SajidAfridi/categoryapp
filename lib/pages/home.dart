import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
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
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            ),
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            final item= CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: GridTile(
                header: Container(
                  child: Text(item.name,style: TextStyle(color: CupertinoColors.white),),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                ),

              child: Image.network(item.image,fit: BoxFit.contain,),

                footer: Container(
                  child: Text(item.price.toString(),style: TextStyle(color: CupertinoColors.white),),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,

                  ),
                ),
              ),
            );
          }
        )
        : Center(
            child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
