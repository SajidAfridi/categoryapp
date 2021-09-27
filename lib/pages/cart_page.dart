import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.theme.textTheme.headline6!.color!).make(), //Need Some editing Maybe...
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),

        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.theme.secondaryHeaderColor).make(),
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not supported Yet".text.make(),
                ));
              },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.buttonColor,
              ),
          ),
            child: "Buy".text.white.bold.letterSpacing(1.5).make(),
          ).w32(context),
        ],
      ).p20(),
    );
  }
}
class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
        itemBuilder: (context, index)=>ListTile(
            leading: Icon(Icons.done,),
          trailing: IconButton(
             icon: Icon(Icons.remove),
            onPressed: () {

            },
          ),
          title: _cart.items[index].name.text.make(),
        ),
    );
  }
}

