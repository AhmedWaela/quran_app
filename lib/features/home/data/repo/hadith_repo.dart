import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/home/data/models/ayah_with_hadith.dart';
import 'package:quran_app/features/home/data/models/hadith_model/hadith_model.dart';

abstract class HadithRepo {
  Future<Either<Failure, List<HadithOrAyah>>> getHadithsAndAyahs();
  Future<Either<Failure, HadithModel>> getHadith();
}
