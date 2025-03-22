import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/features/home/data/models/hadith_model/hadith_model.dart';
import 'package:quran_app/features/home/data/repo/hadith_repo_impl.dart';

part 'today_hadith_state.dart';

class TodayHadithCubit extends Cubit<TodayHadithState> {
  TodayHadithCubit() : super(TodayHadithInitial());

  Future<void> getHadith() async {
    emit(TodayHadithLoading());
    final result =
        await HadithRepoImpl(apiService: ApiService(dio: Dio())).getHadith();
    result.fold((failure) {
      emit(TodayHaduthFailed(message: failure.message));
    }, (sucess) {
      emit(TodayHadithLoaded(hadithModel: sucess));
    });
  }
}
