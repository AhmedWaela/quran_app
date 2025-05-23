part of 'quran_cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitial extends QuranState {}

final class QuranLoading extends QuranState {}

final class QuranLoaded extends QuranState {
  final List<SurahModel> surahs;

  const QuranLoaded({required this.surahs});
}

final class QuranFailed extends QuranState {
  final String message;

  const QuranFailed({required this.message});
}
