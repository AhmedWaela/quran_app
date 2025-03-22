part of 'today_ayah_cubit.dart';

sealed class TodayAyahState extends Equatable {
  const TodayAyahState();

  @override
  List<Object> get props => [];
}

final class TodayAyahInitial extends TodayAyahState {}

final class TodayAyahLoading extends TodayAyahState {}

final class TodayAyahLoaded extends TodayAyahState {
  final TodayAyah todayAyah;

  const TodayAyahLoaded({required this.todayAyah});
}

final class TodayAyahFailed extends TodayAyahState {
  final String message;

  const TodayAyahFailed({required this.message});
}
