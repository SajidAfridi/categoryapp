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
        appBar: AppBar(
          backgroundColor: MyTheme.creamColor,
          elevation: 0,
        ),
        backgroundColor: MyTheme.creamColor,
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
        body: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            SizedBox(height: 30,),
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
                      10.heightBox,
                      "This is useless text created by some random generator. jalsdjw  ef alsdfn a asfao weiflsdn a a .This shield has only been infiltrated, vision and a magical. After mashing the melons, with it in a bucket."
                          .text.textStyle(context.captionStyle!).make().p16()
                    ],
                    ).py32().p4(),
            ),
                ))
          ],
        ),
      ),
    );
  }
}
