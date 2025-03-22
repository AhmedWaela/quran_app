import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/home/data/models/azan_model/timings.dart';

abstract class AzahRepo {
  Future<Either<Failure, Timings>> getAzanTiming(
      String date, String country, String city);
}
