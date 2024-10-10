import 'package:app/helper/Api%20class.dart';
import 'package:dio/dio.dart';

class getAllcategory {
  final Dio dio;
  getAllcategory(this.dio);
  Future<List<dynamic>> GetAllcategory() async {
    Response response =
        await Api(Dio()).getRequest('https://fakestoreapi.com/products/categories');
    List<dynamic> list = response.data;
    return list;
  }
}
