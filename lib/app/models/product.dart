// ignore_for_file: unnecessary_this

class Product {
  int? id;
  String? productUniqueId;
  int? userId;
  String? title;
  String? description;
  String? price;
  String? discount;

  Product({
    this.id,
    this.productUniqueId,
    this.userId,
    this.title,
    this.description,
    this.price,
    this.discount,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productUniqueId = json['product_unique_id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];

    price = json['price'];
    discount = json['discount'];
    // var name = ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['product_unique_id'] = this.productUniqueId;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;

    data['price'] = this.price;
    data['discount'] = this.discount;

    return data;
  }
}
