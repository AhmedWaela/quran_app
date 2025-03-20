import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/surahs/presentation/manager/cubit/quran_cubit.dart';
import 'package:quran_app/features/surahs/presentation/views/widgets/story_widget.dart';

class StoriesListView extends StatelessWidget {
  const StoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is SurahLoaded) {
          final ayahs = state.surah.ayahs ?? [];
          return SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ayahs.length,
              itemBuilder: (context, index) {
                return StoryWidget(ayah: ayahs[index]);
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
