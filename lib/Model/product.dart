import 'dart:convert';

class ProductModel {
  ProductModel({
    this.data,
  });

  Product? data;

  factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    data: Product.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Product {
  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.rate,
    this.count
  });

  dynamic id;
  dynamic title;
  dynamic price;
  dynamic description;
  dynamic category;
  dynamic image;
  dynamic rating;
  dynamic rate;
  dynamic count;



  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating : json["rating"],
      rate: json["rating"]["rate"],
      count: json["rating"]["count"]

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title" : title,
    "price" : price,
    "description" : description,
    "category" : category,
    "image" : image,
    "rating" : rating,
    "rate" : rate,
    "count":count

  };


}
