import 'package:app/models/product%20model.dart';
import 'package:dio/dio.dart';

class getAllproducts {
  final Dio dio;
  getAllproducts(this.dio);
  Future<List<ProductModel>> GetAllproductsaync() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
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
