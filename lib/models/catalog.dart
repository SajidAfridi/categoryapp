class CatalogModel {
      static final items = [Item(
      id: 1,
      name: "Iphone 12 Pro",
      description: "Apple Iphone 12th generation",
      price: 999,
      color: "#33505a",
      image: "https://images.unsplash.com/photo-1611791485440-24e8239a0377?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aXBob25lJTIwMTIlMjBwcm98ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"
      ),
      ];
}
class Item{
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.description,
    required this.price, required this.color, required this.image});
}