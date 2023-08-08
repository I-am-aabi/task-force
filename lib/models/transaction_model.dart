class CustomerTransaction {
  String id;
  String name;
  String date;
  int amount;
  int count;
  int total;
  String parentid;
  String uid;
  String product;

 
  CustomerTransaction(
      {required this.name,
      required this.date,
      required this.amount,
      required this.id,
      required this.count,
      required this.parentid,
      required this.uid,
      required this.product,
      required this.total});

  factory CustomerTransaction.fromJson(Map<String, dynamic> json) =>
      CustomerTransaction(
        name: json["name"],
        date: json["date"],
        amount: json["amount"],
        id: json["id"],
        count: json["count"],
        parentid: json["parentid"],
        uid: json["uid"],
        product: json["product"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['date'] = date;
    data['amount'] = amount;
    data['total'] = total;
    data['id'] = id;
    data['product'] = product;
    data['uid'] = uid;
    data['parentid'] = parentid;
    data['count'] = count;
    return data;
  }
}
