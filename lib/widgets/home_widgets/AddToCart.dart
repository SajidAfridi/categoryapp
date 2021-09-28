import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [AddMutation,RemoveMutation,]);
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      child: isInCart ? Icon(Icons.done) :Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.primaryColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
    ).px4();
  }
}
