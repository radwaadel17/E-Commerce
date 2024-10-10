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
}
