import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/story_view_cubit.dart';
import 'widgets/story_view_body.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key});
  static const String route = "/storyView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoryViewCubit()..startProgress(),
      child: const Scaffold(
        backgroundColor: Colors.black87,
        body: StoryViewBody(),
      ),
    );
  }
}
