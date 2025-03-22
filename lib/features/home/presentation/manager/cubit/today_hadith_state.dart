part of 'today_hadith_cubit.dart';

sealed class TodayHadithState extends Equatable {
  const TodayHadithState();

  @override
  List<Object> get props => [];
}

final class TodayHadithInitial extends TodayHadithState {}

final class TodayHadithLoading extends TodayHadithState {}

final class TodayHadithLoaded extends TodayHadithState {
  final HadithModel hadithModel;

  const TodayHadithLoaded({required this.hadithModel});
}

final class TodayHaduthFailed extends TodayHadithState {
  final String message;

  const TodayHaduthFailed({required this.message});
}
