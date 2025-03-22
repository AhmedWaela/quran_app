import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/features/home/data/models/today_ayah/today_ayah.dart';
import 'package:quran_app/features/home/data/repo/today_ayah_repo_impl.dart';

part 'today_ayah_state.dart';

class TodayAyahCubit extends Cubit<TodayAyahState> {
  TodayAyahCubit() : super(TodayAyahInitial());

  Future<void> getTodayAyah() async {
    emit(TodayAyahLoading());
    final result = await TodayAyahRepoImpl(apiService: ApiService(dio: Dio()))
        .getTodayAyah();
    result.fold(
      (l) {
        emit(TodayAyahFailed(message: l.message));
      },
      (r) {
        emit(TodayAyahLoaded(todayAyah: r));
      },
    );
  }
}
