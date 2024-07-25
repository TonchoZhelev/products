import 'package:json_annotation/json_annotation.dart';

part "products.g.dart";

@JsonSerializable()
class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price;

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() {
    return "$id, $title, $description, $thumbnail, $price";
  }
}

@JsonSerializable()
class PaginatedProducts {
  PaginatedProducts({
    required this.products,
  });

  final List<Product> products;

  factory PaginatedProducts.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProductsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedProductsToJson(this);

  @override
  String toString() {
    return products.toString();
  }
}
