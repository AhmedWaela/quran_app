import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "http://api.alquran.cloud/v1/";
  final Dio dio;

  const ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    final response = await dio.get("$_baseUrl$endpoint");
    return response.data;
  }
}
