import 'dart:convert';

class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  bool? isFav;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.isFav});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    isFav =  false ;
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Product.fromDatabase(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    price = map['price'];
    description = map['description'];
    category = map['category'];
    image = map['image'];
    isFav = true  ;
    rating = Rating.fromJson(json.decode(map['rating']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = json.encode(rating!.toJson());
    }
    return data;
  }
}

class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}