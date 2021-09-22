import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key,required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          print("Item Pressed");
        },
        leading: Image.asset("assets/images/login.png"),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\$${item.price.toString()}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}
