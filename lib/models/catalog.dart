class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Heart",
        description: "Important organ",
        price: 999,
        color: "#fff789",
        image: "jane do")
  ];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}
