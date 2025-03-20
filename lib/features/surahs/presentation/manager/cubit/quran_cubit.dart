import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/surahs/data/repo/surahs_repo.dart';
import '../../../../../core/services/quran_service.dart';
import '../../../data/models/surah_model/ayah.dart';
import '../../../data/models/surah_model/surah.dart';
import '../../../data/repo/surah_repo_impl.dart';
part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  var surahRepoImpl = SurahRepoImpl(apiService: ApiService(Dio()));
  Future<void> fetchQuranData(int juzNumber,
      {String? language,
      int? offset,
      int? limit,
      QuranEdition? edition}) async {
    emit(AyahsLoading());
    final result = await surahRepoImpl.getAJuzOfTheQuran(juzNumber,
        language: language, offset: offset, limit: limit, edition: edition);

    result.fold((failure) => emit(AyahsFailed(message: failure.message)),
        (ayahs) => emit(AyahsLoaded(ayahs: ayahs)));
  }

  Future<void> getACompleteQuranEdition(
      String? language, QuranEdition edition) async {
    emit(QuranLoading());
    final result =
        await surahRepoImpl.getACompleteQuranEdition(language, edition);

    result.fold((failure) => emit(QuranFailed(message: failure.message)),
        (ayahs) => emit(QuranLoaded(surah: ayahs)));
  }

  Future<void> getASurahFromQuran(int surahNumber,
      {String? language,
      int? offset,
      int? limit,
      List<QuranEdition>? edition}) async {
    emit(SurahLoading());
    final result = await surahRepoImpl.getASurahFromQuran(surahNumber,
        language: language, offset: offset, limit: limit, edition: edition);

    result.fold((failure) => emit(SurahFailed(message: failure.message)),
        (success) => emit(SurahLoaded(surah: success)));
  }

  Future<void> getAyahFromQuran({
    int? ayahNumber,
    int? start,
    int? end,
    String? language,
    List<QuranEdition>? editions,
  }) async {
    emit(TodayAyahLoading());
    final reault = await surahRepoImpl.getAyah(
        ayahNumber: ayahNumber,
        start: start,
        end: end,
        language: language,
        editions: editions);
    reault.fold((failure) {
      emit(TodayAyahFailed(message: failure.message));
    }, (sucess) {
      emit(TodayAyahLoaded(ayahs: sucess));
    });
  }
}
