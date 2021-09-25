import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              ElevatedButton(
                onPressed: (){},
                child: Text("Buy"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluish,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  ),
                ),
              ).wh(100, 45),
            ],
          ).p16(),
        ),
        backgroundColor: MyTheme.creamColor,
        body: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h40(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                  color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                    children: [
                      catalog.name.text.xl4.bold.color(MyTheme.darkBluish).make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle!).make(),
                    ],
                    ).py64(),
            ),
                ))
          ],
        ).p16(),
      ),
    );
  }
}
