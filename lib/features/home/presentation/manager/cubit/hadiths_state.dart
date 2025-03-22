part of 'hadiths_cubit.dart';

sealed class HadithsState extends Equatable {
  const HadithsState();

  @override
  List<Object> get props => [];
}

final class HadithsInitial extends HadithsState {}

final class HadithLoading extends HadithsState {}

final class HadithLoaded extends HadithsState {
  final List<HadithOrAyah> hadiths;

  const HadithLoaded({required this.hadiths});
}

final class HadithFailed extends HadithsState {
  final String message;

  const HadithFailed({required this.message});
}
