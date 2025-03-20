import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/surahs/data/models/surah_model/surah.dart';

import '../models/surah_model/ayah.dart';

abstract class SurahsRepo {
  Future<Either<Failures, List<Surah>>> getACompleteQuranEdition(
    String? language,
    QuranEdition edition,
  );
  Future<Either<Failures, List<Ayah>>> getAJuzOfTheQuran(
    int juzNumber, {
    String language,
    int offset,
    int limit,
    QuranEdition edition,
  });
  Future<Either<Failures, Surah>> getASurahFromQuran(
    int surahNumber, {
    String? language,
    int? offset,
    int? limit,
    List<QuranEdition>? edition,
  });

  Future<Either<Failures, Ayah>> getAyah(
      {int? ayahNumber,
      int? start,
      int? end,
      String? language,
      List<QuranEdition> editions});
}

enum QuranEdition {
  uthmani,
  asad,
  alafasy,
  hamidullah,
}
