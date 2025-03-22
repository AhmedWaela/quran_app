import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get({required String url}) async {
    final Response response = await dio.get(url);
    return response.data;
  }
}
