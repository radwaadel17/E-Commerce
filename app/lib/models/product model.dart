import 'dart:convert';

import 'package:app/models/rating%20model.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String categorey;
  final String Image;
  final String description;
  final RatingModel rating ;
  ProductModel(
      {required this.id,
      required this.rating ,
      required this.Image,
      required this.categorey,
      required this.price,
      required this.title,
      required this.description});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        Image: jsonData['image'],
        categorey: jsonData['category'],
        price: jsonData['price'],
        title: jsonData['title'],
        description: jsonData['description'],
        rating: RatingModel.fromJson([jsonData['rating']]));
  }
}
