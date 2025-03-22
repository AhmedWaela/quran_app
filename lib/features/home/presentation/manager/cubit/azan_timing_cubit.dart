import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/data/models/azan_model/timings.dart';
import 'package:quran_app/features/home/data/repo/azan_repo_impl.dart';

part 'azan_timing_state.dart';

class AzanTimingCubit extends Cubit<AzanTimingState> {
  AzanTimingCubit() : super(AzanTimingInitial());

  getAzanTiming(
    String date,
    String country,
    String city,
  ) async {
    emit(AzanTimingLoading());
    final result = await AzanRepoImpl().getAzanTiming(date, country, city);
    result.fold((failure) {
      emit(AzanTimingFailed(message: failure.message));
    }, (success) {
      emit(AzanTimingLoaded(success));
    });
  }
}
