import 'package:app/helper/Api%20class.dart';
import 'package:app/models/product%20model.dart';
import 'package:dio/dio.dart';
class UpdateProduct {
  final Dio dio;
  UpdateProduct(this.dio);
  Future<ProductModel> updateProduct(
      {required String title,
      required dynamic price,
      required String description,
      required String image,
      required String category,
      required dynamic id ,
      }) async {
    Response response = await Api(Dio())
        .putRequest(
       url: 'https://fakestoreapi.com/products/$id', values: {
      "title": '$title',
      "price": '$price',
      "description": '$description',
      "image": '$image',
      "category": '$category',
    });
    Map<String, dynamic> data = response.data;
    if (response.statusCode == 200) {
      ProductModel productModel = ProductModel.fromJson(data);
      return productModel;
    } else {
      throw Exception(
          'There is a problem the status code is${response.statusCode} with data ${response.data}');
    }
  }
}
