import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/features/home/data/models/azan_model/timings.dart';
import 'package:quran_app/features/home/data/repo/azah_repo.dart';

class AzanRepoImpl implements AzahRepo {
  @override
  Future<Either<Failure, Timings>> getAzanTiming(
      String date, String country, String city) async {
    try {
      final response = await ApiService(dio: Dio()).get(
          url:
              "https://api.aladhan.com/v1/timingsByCity/$date?country=$country&city=$city");
      return right(Timings.fromMap(response["data"]["timings"]));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure("error"));
      }
    }
  }
}
