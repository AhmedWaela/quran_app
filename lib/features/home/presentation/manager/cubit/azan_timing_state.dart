part of 'azan_timing_cubit.dart';

sealed class AzanTimingState extends Equatable {
  const AzanTimingState();

  @override
  List<Object> get props => [];
}

final class AzanTimingInitial extends AzanTimingState {}

final class AzanTimingLoading extends AzanTimingState {}

final class AzanTimingLoaded extends AzanTimingState {
  final Timings timings;

  const AzanTimingLoaded(this.timings);
}

final class AzanTimingFailed extends AzanTimingState {
  final String message;

  const AzanTimingFailed({required this.message});
}
