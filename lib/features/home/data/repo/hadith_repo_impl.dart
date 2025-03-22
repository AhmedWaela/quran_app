import 'dart:convert';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/features/home/data/models/ayah_with_hadith.dart';
import 'package:quran_app/features/home/data/models/hadith_model/hadith_model.dart';
import 'package:quran_app/features/home/data/models/today_ayah/today_ayah.dart';
import 'package:quran_app/features/home/data/repo/hadith_repo.dart';

class HadithRepoImpl implements HadithRepo {
  final ApiService apiService;

  HadithRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<HadithOrAyah>>> getHadithsAndAyahs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedData = prefs.getString("cachedHadithsWithAyah");
      final String? lastFetchDate = prefs.getString("lastFetchDate");
      final String today = DateTime.now().toIso8601String().split("T")[0];

      if (cachedData != null && lastFetchDate == today) {
        List<dynamic> cachedList = jsonDecode(cachedData);
        List<HadithOrAyah> hadithsWithAyahs = cachedList
            .map((hadithWithAyahs) => HadithOrAyah.fromMap(hadithWithAyahs))
            .toList();
        return right(hadithsWithAyahs);
      }

      final hadithResponse = await apiService.get(
        url:
            r"https://hadithapi.com/public/api/hadiths?apiKey=$2y$10$wRorAoSYCw1WeG3pQJvWtuNnDjQ1xirco4EsnQbPQN6EEzoIETa",
      );

      List<dynamic>? hadithsData = hadithResponse["hadiths"]["data"];
      if (hadithsData == null || hadithsData.isEmpty) {
        return left(ServerFailure("❌ لا توجد أحاديث متاحة"));
      }

      List<HadithModel> hadithsList = hadithsData
          .take(4)
          .map((hadith) => HadithModel.fromMap(hadith))
          .toList();

      List<TodayAyah> ayahsList = [];
      for (int i = 0; i < 3; i++) {
        final int randomSurah = Random().nextInt(114) + 1;
        final surahData = await apiService.get(
          url: "http://api.alquran.cloud/v1/surah/$randomSurah",
        );

        if (surahData["data"] == null || surahData["data"]["ayahs"] == null) {
          return left(ServerFailure(
              "❌ لم يتم العثور على بيانات للسورة رقم $randomSurah"));
        }

        List<dynamic> ayahs = surahData["data"]["ayahs"];
        if (ayahs.isEmpty) {
          return left(ServerFailure(
              "❌ لم يتم العثور على آيات في السورة رقم $randomSurah"));
        }

        final int randomAyah = Random().nextInt(ayahs.length) + 1;
        final ayahData = await apiService.get(
          url:
              "http://api.alquran.cloud/v1/ayah/$randomSurah:$randomAyah/ar.alafasy",
        );

        if (ayahData["data"] == null) {
          return left(ServerFailure(
              "❌ لم يتم العثور على آية رقم $randomAyah من السورة $randomSurah"));
        }

        ayahsList.add(TodayAyah.fromMap(ayahData));
      }
      List<HadithOrAyah> combinedList = [];

      for (int i = 0; i < 4; i++) {
        combinedList.add(HadithOrAyah(
          hadith: hadithsList[i],
          ayah: ayahsList[i % ayahsList.length],
        ));
      }

// Add 3 more Ayahs without Hadiths
      for (int i = 0; i < 3; i++) {
        combinedList.add(HadithOrAyah(
          hadith: null,
          ayah: ayahsList[i],
        ));
      }

      prefs.setString("cachedHadithsWithAyah",
          jsonEncode(combinedList.map((e) => e.toMap()).toList()));
      prefs.setString("lastFetchDate", today);
      return right(combinedList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure("❌ خطأ غير متوقع: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, HadithModel>> getHadith() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? cachedTodayHadith = shared.getString("cachedTodayHadith");
      String? cachedTodayHadithDate = shared.getString("cachedTodayHadithDate");
      String today = DateTime.now().toIso8601String().split("T")[0];

      // **التحقق من الكاش**
      if (cachedTodayHadith != null && cachedTodayHadithDate == today) {
        var jsonDecode2 = jsonDecode(cachedTodayHadith);
        return right(HadithModel.fromMap(jsonDecode2));
      }
      var apiKey =
          r'$2y$10$wRorAoSYCw1WeG3pQJvWtuNnDjQ1xirco4EsnQbPQN6EEzoIETa';

      final response = await apiService.get(
          url:
              "https://hadithapi.com/public/api/hadiths?apiKey=$apiKey&hadithNumber=${Random().nextInt(3115) + 1}");
      var hadithList = response["hadiths"]["data"] as List<dynamic>;
      if (hadithList.isEmpty) {
        return left(ServerFailure("⚠️ لم يتم العثور على حديث."));
      }
      var hadithData = hadithList[0];
      await shared.setString("cachedTodayHadith", jsonEncode(hadithData));
      await shared.setString("cachedTodayHadithDate", today);
      return right(HadithModel.fromMap(hadithData));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure("❌ خطأ غير متوقع: ${e.toString()}"));
      }
    }
  }
}
