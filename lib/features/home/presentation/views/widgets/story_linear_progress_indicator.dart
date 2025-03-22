import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/story_view_cubit.dart';

class StoryLinearProgressIndicator extends StatelessWidget {
  const StoryLinearProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoryViewCubit, StoryViewState>(
      listener: (context, state) {
        if (state is ViewClosed) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return LinearProgressIndicator(
          value: BlocProvider.of<StoryViewCubit>(context).progress,
          backgroundColor: Colors.white30,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          minHeight: 6,
        );
      },
    );
  }
}
