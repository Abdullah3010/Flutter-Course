import 'package:dio/dio.dart';
import 'package:new_app/core/apis/api_endpoints.dart';

class DioHelper {
  static late Dio dio;

  static void initDio() {
    dio = Dio(
      BaseOptions(
        headers: {
          'X-Api-Key': '9a3cf15b0bb44dd4b6a4f344675959cd',
        },
      ),
    );
  }

  static Future<dynamic> getAllNews() async {
    final Response<dynamic> response = await dio.get(
      NewsApiEndpoints.everything,
      queryParameters: {
        'q': 'Tesla',
        'language': 'en',
      },
    );
    return response.data;
  }
}
