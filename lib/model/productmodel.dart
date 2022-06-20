class Productmodel {
  var id;
  var title;
  var image;
  String category;
  double price;

  Productmodel({
    this.id,
    this.title,
    this.image,
    this.category = "",
    this.price = 0.0,
  });

  // factory Productmodel.fromjson(Map<dynamic, dynamic> json) {
  //   return Productmodel(
  //     id: json["id"],
  //     title: json["title"],
  //     image: json["image"],
  //     category: json["category"],
  //     price: json["price"],
  //   );
  //}

  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      category: json["category"],
      // price: json["price"].toDouble() ?? 0.0,
      price: double.tryParse(json["price"].toString()) ?? 0.0,
      //price: json["price"] != null ? double.parse(json["price"]) : 0.0,
    );
  }
  Map<String, dynamic> toJson() =>
      {"id": id, "title": title, "image": image, "price": category};
}
