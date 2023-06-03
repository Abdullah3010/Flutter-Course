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

  static Future<dynamic> getEvrethingNews() async {
    final Response<dynamic> response = await dio.get(
      NewsApiEndpoints.everything,
      queryParameters: {
        'q': 'tesla',
      },
    );
    return response.data;
  }

  static Future<dynamic> getTopheadlinesNews() async {
    final Response<dynamic> response = await dio.get(
      NewsApiEndpoints.topHeadline,
      queryParameters: {
        'q': 'corona',
      },
    );
    return response.data;
  }

  static Future<dynamic> searchForNews({
    String? query,
    String? from,
    String? to,
  }) async {
    final Response<dynamic> response = await dio.get(
      NewsApiEndpoints.everything,
      queryParameters: {
        'q': query ?? 'tesla',
        'from': from ?? '',
        'to': to ?? '',
      },
    );
    return response.data;
  }
}
