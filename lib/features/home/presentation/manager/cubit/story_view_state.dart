part of 'story_view_cubit.dart';

sealed class StoryViewState extends Equatable {
  const StoryViewState();

  @override
  List<Object?> get props => [];
}

final class StoryViewInitial extends StoryViewState {}

class StoryViewProgressUpdated extends StoryViewState {
  final double progress;
  const StoryViewProgressUpdated(this.progress);

  @override
  List<Object?> get props => [progress];
}

final class ViewClosed extends StoryViewState {}
