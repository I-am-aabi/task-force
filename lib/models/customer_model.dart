class Customer {
  String id;
  String name;
  String adress;
  int phone;
  String uid;

  Customer(
      {
      required this.name,
      required this.adress,
      required this.phone,
      required this.uid,
      required this.id
      });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      name: json["name"],
      adress: json["adress"],
      phone: json["phone"],
      uid: json["uid"],
      id: json["id"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['adress'] = adress;
    data['phone'] = phone;
    data['uid'] = uid;
    data['id'] = id;
    return data;
  }
}
