import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_details.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        itemBuilder: (context, index){
          final catalog= CatalogModel.items[index];
          return InkWell(
              child: CatalogItem(catalog: catalog),
              onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeDetailPage(catalog: catalog))),
          );
        },
        itemCount: CatalogModel.items.length,
      ),
    );
  }
}
class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              child: CatalogImage(image: catalog.image),
              tag: Key(catalog.id.toString()),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl.bold.color(MyTheme.darkBluish).make(),
              catalog.desc.text.textStyle(context.captionStyle!).make(),
              SizedBox(height: 20),
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Add To Cart"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        context.theme.buttonColor,
                      ),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                  )
                ],
              ).p4(),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).square(170.0).make().py8();
  }
}