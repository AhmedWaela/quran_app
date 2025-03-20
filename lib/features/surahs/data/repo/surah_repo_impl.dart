import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/services/quran_service.dart';
import 'package:quran_app/features/surahs/data/models/surah_model/surah.dart';
import 'package:quran_app/features/surahs/data/repo/surahs_repo.dart';

import '../models/surah_model/ayah.dart';

class SurahRepoImpl implements SurahsRepo {
  final ApiService apiService;

  const SurahRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<Surah>>> getACompleteQuranEdition(
    String? language,
    QuranEdition edition,
  ) async {
    try {
      var endpoint =
          "quran/$language.${edition == QuranEdition.asad ? "asad" : "alafasy"}";
      final data = await apiService.get(
          endpoint: language == null ? "quran/quran-uthmani" : endpoint);
      List<Surah> surahs = [];
      for (var surah in data["data"]["surahs"]) {
        final surahModel = Surah.fromMap(surah);
        surahs.add(surahModel);
      }
      return right(surahs);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<Ayah>>> getAJuzOfTheQuran(
    int juzNumber, {
    String? language,
    int? offset,
    int? limit,
    QuranEdition? edition,
  }) async {
    try {
      // Construct the base endpoint
      String endpoint = "juz/$juzNumber";
      if (edition == QuranEdition.uthmani) {
        endpoint += "/quran-uthmani";
      } else if (edition == QuranEdition.asad && language != null) {
        endpoint += "/$language.asad";
      } else if (edition == QuranEdition.alafasy && language != null) {
        endpoint += "/$language.alafasy";
      } else if (edition == QuranEdition.hamidullah && language != null) {
        endpoint += "/$language.hamidullah";
      }
      if (offset != null) {
        endpoint += "?offset=$offset";
        if (limit != null) {
          endpoint += "&limit=$limit";
        }
      }

      // Fetch the data
      final data = await apiService.get(endpoint: endpoint);

      // Parse the response
      var ayahsList = data["data"]["ayahs"] as List<dynamic>;
      List<Ayah> ayahs =
          ayahsList.map<Ayah>((surah) => Ayah.fromMap(surah)).toList();

      return right(ayahs);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, Surah>> getASurahFromQuran(
    int surahNumber, {
    String? language,
    int? offset,
    int? limit,
    List<QuranEdition>? edition,
  }) async {
    try {
      // Construct the base endpoint
      String endpoint = "surah/$surahNumber";

      // Handle editions dynamically
      if (edition != null && edition.isNotEmpty) {
        List<String> editionParams = edition
            .map((e) {
              if (e == QuranEdition.uthmani) return "quran-uthmani";
              if (e == QuranEdition.asad) return "$language.asad";
              if (e == QuranEdition.alafasy) return "$language.alafasy";
              if (e == QuranEdition.hamidullah) return "$language.hamidullah";
              return "";
            })
            .where((e) => e.isNotEmpty)
            .toList();

        if (editionParams.isNotEmpty) {
          endpoint +=
              "/${editionParams.join(',')}"; // Combines editions correctly
        }
      }
      List<String> queryParams = [];
      if (offset != null) queryParams.add("offset=$offset");
      if (limit != null) queryParams.add("limit=$limit");

      if (queryParams.isNotEmpty) {
        endpoint += "?${queryParams.join('&')}";
      }

      // Fetch the data
      final data = await apiService.get(endpoint: endpoint);

      // Parse the response into a Surah model
      final surahModel = Surah.fromMap(data["data"]);

      return right(surahModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, Ayah>> getAyah({
    int? ayahNumber,
    int? start,
    int? end,
    String? language,
    List<QuranEdition>? editions,
  }) async {
    try {
      // التحقق من صحة المدخلات
      if (ayahNumber == null && (start == null || end == null)) {
        return left(ServerFailure("يجب تحديد رقم آية أو نطاق (start و end)"));
      }

      // تحديد نقطة النهاية API
      late String endpoint;
      if (ayahNumber != null) {
        endpoint = "ayah/$ayahNumber";
      } else {
        endpoint = "ayah/$start:$end";
      }

      // معالجة الإصدارات (editions)
      if (editions != null && editions.isNotEmpty) {
        List<String> editionParams = editions
            .map((e) {
              switch (e) {
                case QuranEdition.uthmani:
                  return "quran-uthmani";
                case QuranEdition.asad:
                  return "$language.asad";
                case QuranEdition.alafasy:
                  return "$language.alafasy";
                case QuranEdition.hamidullah:
                  return "$language.hamidullah";
                default:
                  return "";
              }
            })
            .where((e) => e.isNotEmpty)
            .toList();

        if (editionParams.isNotEmpty) {
          endpoint += "/${editionParams.join(',')}";
        }
      }

      // جلب البيانات من API
      final data = await apiService.get(endpoint: endpoint);

      // التحقق من البيانات المسترجعة
      if (data == null || data["data"] == null) {
        return left(ServerFailure("لم يتم العثور على بيانات للآية المطلوبة"));
      }

      // تحويل البيانات إلى نموذج Ayah
      final ayah = Ayah.fromMap(data["data"]);

      return right(ayah);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
