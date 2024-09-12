class ProductModel {
  final int id;
  final String title;
  final double price;
  final String desc;
  final String img;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.desc,
      required this.img,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"].toDouble(),
      desc: jsonData["description"],
      img: jsonData["image"],
      rating: RatingModel.fromJson(jsonData["rating"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "desc": desc,
        "img": img,
      };
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
        rate: jsonData["rate"].toDouble(), count: jsonData["count"]);
  }
}
