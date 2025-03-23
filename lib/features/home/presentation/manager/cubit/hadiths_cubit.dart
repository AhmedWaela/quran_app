import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/features/home/data/repo/hadith_repo_impl.dart';

import '../../../data/models/ayah_with_hadith.dart';
part 'hadiths_state.dart';

class HadithsCubit extends Cubit<HadithsState> {
  HadithsCubit() : super(HadithsInitial());
  var hadithRepoImpl = HadithRepoImpl(apiService: ApiService());

  Future<void> getHadithsAndAyahs() async {
    emit(HadithLoading());

    final result = await hadithRepoImpl.getHadithsAndAyahs();

    result.fold(
      (l) {
        emit(HadithFailed(message: l.message));
      },
      (r) {
        emit(HadithLoaded(hadiths: r));
      },
    );
  }
}
