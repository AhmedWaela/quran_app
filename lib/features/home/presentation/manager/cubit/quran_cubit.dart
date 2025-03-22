import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/features/home/data/models/surah_model/surah_model.dart';
import 'package:quran_app/features/home/data/repo/today_ayah_repo_impl.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  Future<void> getQuran() async {
    emit(QuranLoading());
    final result =
        await TodayAyahRepoImpl(apiService: ApiService(dio: Dio())).getSurahs();
    result.fold((failure) {
      emit(QuranFailed(message: failure.message));
    }, (sucess) {
      emit(QuranLoaded(surahs: sucess));
    });
  }
}
