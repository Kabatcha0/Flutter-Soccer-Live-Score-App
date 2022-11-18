import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://v3.football.api-sports.io/",
        receiveDataWhenStatusError: false));
  }

  static Future<Response> get(
      {required String path, required Map<String, dynamic> query}) async {
    dio.options.headers = {
      'x-rapidapi-host': "v3.football.api-sports.io",
      'x-rapidapi-key': "9fb549da3c30d17015485dacd28724b4"
    };
    return await dio.get(path, queryParameters: query);
  }
}
