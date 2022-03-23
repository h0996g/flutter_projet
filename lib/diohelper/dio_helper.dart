import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  static Future<Response> getData(
      {required url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    return await dio.post(url, queryParameters: query, data: data);
  }
}
