import 'package:app/helper/Api%20class.dart';
import 'package:app/models/product%20model.dart';
import 'package:dio/dio.dart';

class PostAddProduct {
  final Dio dio;
  PostAddProduct(this.dio);
  Future<ProductModel> postAddproduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Response response = await Api(Dio())
        .postRequest(url: 'https://fakestoreapi.com/products', values: {
      "title": '$title',
      "price": double.parse(price),
      "description": '$description',
      "image": '$image',
      "category": '$category',
    });
    Map<String, dynamic> data = response.data;
    if(response.statusCode == 200 ){
      ProductModel productModel = ProductModel.fromJson(data);
      return productModel;   
    }
    else{
      throw Exception('There is a problem the status code is${response.statusCode} with data ${response.data}');
    }
  
  }
}
