import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'story_view_state.dart';

class StoryViewCubit extends Cubit<StoryViewState> {
  StoryViewCubit() : super(StoryViewInitial());

  double progress = 0.0;
  Ticker? _ticker;
  late String displayText;
  Duration elapsedTime = Duration.zero;
  DateTime? startTime;

  void startProgress() {
    if (_ticker != null && _ticker!.isActive) return;

    startTime = DateTime.now().subtract(elapsedTime);

    _ticker = Ticker(
      (elapsed) {
        if (isClosed) return;

        final currentTime = DateTime.now();
        final elapsedMilliseconds =
            currentTime.difference(startTime!).inMilliseconds;
        progress = (elapsedMilliseconds / 5000).clamp(0.0, 1.0);

        emit(StoryViewProgressUpdated(progress));

        if (progress >= 1.0) {
          stopProgress();
          emit(ViewClosed());
        }
      },
    );

    _ticker?.start();
  }

  void stopProgress() {
    if (_ticker != null && _ticker!.isActive) {
      _ticker?.stop();
      _ticker?.dispose();
      _ticker = null;
      elapsedTime = DateTime.now().difference(startTime!);
    }
  }

  @override
  Future<void> close() {
    stopProgress();
    return super.close();
  }
}
