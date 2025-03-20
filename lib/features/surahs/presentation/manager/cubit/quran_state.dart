part of 'quran_cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitial extends QuranState {}

final class AyahsLoading extends QuranState {}

final class AyahsLoaded extends QuranState {
  final List<Ayah> ayahs;

  const AyahsLoaded({required this.ayahs});
}

final class AyahsFailed extends QuranState {
  final String message;

  const AyahsFailed({required this.message});
}

final class TodayAyahLoading extends QuranState {}

final class TodayAyahLoaded extends QuranState {
  final Ayah ayahs;

  const TodayAyahLoaded({required this.ayahs});
}

final class TodayAyahFailed extends QuranState {
  final String message;

  const TodayAyahFailed({required this.message});
}

final class SurahLoading extends QuranState {}

final class SurahLoaded extends QuranState {
  final Surah surah;

  const SurahLoaded({required this.surah});
}

final class SurahFailed extends QuranState {
  final String message;

  const SurahFailed({required this.message});
}

final class QuranLoading extends QuranState {}

final class QuranLoaded extends QuranState {
  final List<Surah> surah;

  const QuranLoaded({required this.surah});
}

final class QuranFailed extends QuranState {
  final String message;

  const QuranFailed({required this.message});
}
