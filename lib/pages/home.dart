import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
      ),
      body: Center(
      child: Container(
      child: Text("Welcome"),
    ),
    ),
      drawer: MyDrawer(),
    );
  }
}
