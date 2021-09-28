class CatalogModel {
      static List<Item> items= [Item(
      id: 1,
      name: "Iphone 12 Pro",
      desc: "Apple Iphone 12th generation",
      price: 999,
      color: "#33505a",
      image:
      "https://images.unsplash.com/photo-1611791485440-24e8239a0377?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aXBob25lJTIwMTIlMjBwcm98ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
      ),
      ];
      Item getByid(int id)=>items.firstWhere((element) => element.id == id, orElse: null);
      Item getByPosition(int pos)=>items[pos];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

//<editor-fold desc="Data Methods">

  const Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          desc == other.desc &&
          price == other.price &&
          color == other.color &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode;

  @override
  String toString() {
    return 'Item{' +
        ' id: $id,' +
        ' name: $name,' +
        ' desc: $desc,' +
        ' price: $price,' +
        ' color: $color,' +
        ' image: $image,' +
        '}';
  }

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'desc': this.desc,
      'price': this.price,
      'color': this.color,
      'image': this.image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

//</editor-fold>
}