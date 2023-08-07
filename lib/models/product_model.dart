class Product {
  String id;
  String name;
  String description;
  int stock;
  int price;
  String uid;
  Product(
      {required this.name,
      required this.description,
      required this.stock,
      required this.price,
      required this.uid,
      required this.id
      
      });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"],
        uid: json["uid"],
        id: json["id"]
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stock'] = stock;
    data['uid'] = uid;
    data['id'] = id;
    return data;
  }
}
