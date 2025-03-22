import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/data/models/ayah_with_hadith.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/story_view_cubit.dart';
import 'close_story_button.dart';
import 'story_linear_progress_indicator.dart';

class StoryViewBody extends StatelessWidget {
  const StoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onVerticalDragStart: (details) {
          BlocProvider.of<StoryViewCubit>(context).stopProgress();
        },
        onVerticalDragEnd: (details) {
          BlocProvider.of<StoryViewCubit>(context).startProgress();
        },
        onTapUp: (d) {
          BlocProvider.of<StoryViewCubit>(context).startProgress();
        },
        onTapDown: (d) {
          BlocProvider.of<StoryViewCubit>(context).stopProgress();
        },
        child: Column(
          children: [
            StoryLinearProgressIndicator(),
            CloseStoryButton(),
            Expanded(
              child: Center(child: HadithOrAyahText()),
            ),
          ],
        ),
      ),
    );
  }
}

class HadithOrAyahText extends StatelessWidget {
  const HadithOrAyahText({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as List;
    final hadithOrAyahModel = arguments[0] as HadithOrAyah;
    final bool isHadith = arguments[1] as bool;

    final String text = isHadith
        ? hadithOrAyahModel.hadith?.hadithArabic ?? "لا يوجد حديث"
        : hadithOrAyahModel.ayah.data?.text ?? "لا يوجد اية";
    final String text2 = isHadith
        ? hadithOrAyahModel.hadith?.chapter?.chapterArabic ?? ""
        : hadithOrAyahModel.ayah.data?.surah?.name ?? "";
    return BlocBuilder<StoryViewCubit, StoryViewState>(
      builder: (context, state) {
        double opacity = 0.0;

        if (state is StoryViewProgressUpdated) {
          opacity = state.progress > 0.2 ? 1.0 : 0.0;
        }

        return AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // ✅ إضافة هامش لتحسين العرض
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    text2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
