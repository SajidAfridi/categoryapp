import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart= CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);

    return ElevatedButton(
      onPressed: (){
        isInCart= isInCart.toggle();
        final _catalog= CatalogModel();
        _cart.catalog= _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      child: isInCart ? Icon(Icons.done) :Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
    ).px4();
  }
}
