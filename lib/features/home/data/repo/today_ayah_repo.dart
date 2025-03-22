import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/home/data/models/surah_model/surah_model.dart';
import 'package:quran_app/features/home/data/models/today_ayah/today_ayah.dart';

abstract class TodayAyahRepo {
  Future<Either<Failure, TodayAyah>> getTodayAyah();
  Future<Either<Failure, List<SurahModel>>> getSurahs();
}
