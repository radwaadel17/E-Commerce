import 'package:app/models/product%20model.dart';
import 'package:dio/dio.dart';

class getCategory {
  final Dio dio;
  getCategory(this.dio);
  Future<List<ProductModel>> GetCategory({required String value}) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/category/$value');
    List<dynamic> JsonDatalist = response.data;
    List<ProductModel> listProductModel = getProductList(JsonDatalist);
    return listProductModel;
  }
}
List<ProductModel> getProductList(List<dynamic> JsonDatalist) {
  List<ProductModel> list = [];
  for (int i = 0; i < JsonDatalist.length; i++) {
    list.add(ProductModel.fromJson(JsonDatalist[i]));
  }
  return list;
}
