import 'package:flutter_catalog/models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  //collection of ids store ids of each items
 final List<int> _itemIds= [];

 CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog=newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByid(id)).toList();

  //get total price

  num get totalPrice => items.fold(0, (total, current) => total= current.price);

  void add(Item item){
    _itemIds.add(item.id);
  }
  void remover(Item item){
    _itemIds.remove(item.id);
  }

}
