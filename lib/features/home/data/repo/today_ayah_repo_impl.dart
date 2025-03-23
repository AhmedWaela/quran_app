import 'dart:convert';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/services/a.dart';
import 'package:quran_app/features/home/data/models/surah_model/surah_model.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/features/home/data/models/today_ayah/today_ayah.dart';
import 'package:quran_app/features/home/data/repo/today_ayah_repo.dart';

class TodayAyahRepoImpl implements TodayAyahRepo {
  static final prefs = SharedPreferencesPlugin.instance;
  final ApiService apiService;
  static const int totalSurahs = 114;
  static const String ayahKey = "today_ayah";
  static const String dateKey = "ayah_date";

  const TodayAyahRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, TodayAyah>> getTodayAyah() async {
    try {
      final String? storedAyah = prefs.getString(ayahKey);
      final String? storedDate = prefs.getString(dateKey);
      final String today = DateTime.now().toIso8601String().split("T")[0];

      if (storedAyah != null && storedDate == today) {
        return right(TodayAyah.fromMap(jsonDecode(storedAyah)));
      }

      final int randomSurah = Random().nextInt(totalSurahs) + 1;
      final surahData = await apiService.get(
          url: "http://api.alquran.cloud/v1/surah/$randomSurah");

      if (surahData["data"] == null || surahData["data"]["ayahs"] == null) {
        return left(
            ServerFailure("❌ لا توجد بيانات متاحة للسورة رقم $randomSurah"));
      }

      final List<dynamic> ayahs = surahData["data"]["ayahs"];
      if (ayahs.isEmpty) {
        return left(ServerFailure("❌ لا توجد آيات في السورة رقم $randomSurah"));
      }

      final int totalAyahs = ayahs.length;
      final int randomAyah = Random().nextInt(totalAyahs) + 1;

      final ayahData = await apiService.get(
          url:
              "http://api.alquran.cloud/v1/ayah/$randomSurah:$randomAyah/ar.alafasy");

      if (ayahData["data"] == null) {
        return left(ServerFailure(
            "❌ لم يتم العثور على آية رقم $randomAyah من السورة $randomSurah"));
      }

      var todayAyah = TodayAyah.fromMap(ayahData);

      await prefs.setString(ayahKey, jsonEncode(todayAyah.toMap()));
      await prefs.setString(dateKey, today);

      return right(todayAyah);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<SurahModel>>> getSurahs() async {
    const String ayahKey = "surahs";

    try {
      final String? storedAyah = prefs.getString(ayahKey);

      // **استرجاع البيانات المخزنة إذا كانت موجودة ومحدثة**
      if (storedAyah != null) {
        final List<dynamic> decodedList = jsonDecode(storedAyah);
        final List<SurahModel> surahsModel =
            decodedList.map((e) => SurahModel.fromMap(e)).toList();
        return right(surahsModel);
      }

      // **جلب البيانات من API**
      final ayahData = await apiService.get(
          url: "http://api.alquran.cloud/v1/quran/ar.alafasy");

      final List<SurahModel> surahsModel = (ayahData["data"]["surahs"] as List)
          .map((surah) => SurahModel.fromMap(surah))
          .toList();

      // **حفظ البيانات في التخزين المحلي**
      await prefs.setString(
          ayahKey, jsonEncode(surahsModel.map((e) => e.toMap()).toList()));

      return right(surahsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
