import 'package:dio/dio.dart';
import 'package:quran_app/main.dart';

class ApiService {
  ApiService();
  Future<Map<String, dynamic>> get({required String url}) async {
    final Response response = await DioConfig.dio.get(url);
    return response.data;
  }
}
