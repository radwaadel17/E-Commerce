import 'package:dio/dio.dart';

class Api {
  final Dio dio;
  Api(this.dio);
  Future<Response> getRequest(String url) async {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'There is a problem the status code is${response.statusCode}');
    }
  }
  Future<Response> postRequest({required String url ,String? token , required values}) async {
    Map<String , String> headres = {};
    if(token != null){
        headres['Authorization'] = 'Bearer $token';
    }
    Response response = await dio.post(url , data: values , options: Options(
      headers: headres,
    ));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'There is a problem the status code is${response.statusCode}');
    }
  }
  Future<Response> putRequest({required String url ,String? token , required values}) async {
    Map<String , String> headres = {'Content-Type': 'application/x-www-form-urlencoded'};
    if(token != null){
        headres['Authorization'] = 'Bearer $token';
    }
    Response response = await dio.put(url , data: values , options: Options(
      headers: headres,
    ));
     print('$values');
    if (response.statusCode == 200) {
      print(response.data);
      return response;
      
    } else {
      throw Exception(
          'There is a problem the status code is${response.statusCode}');
    }
  }
}
