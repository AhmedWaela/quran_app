import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/hadiths_cubit.dart';
import 'package:shimmer/shimmer.dart';
import 'hadith_or_ayah_widget.dart';

class StoriesListView extends StatelessWidget {
  const StoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: BlocBuilder<HadithsCubit, HadithsState>(
        builder: (context, state) {
          if (state is HadithLoading) {
            // Show shimmer placeholders
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Show 5 shimmer items as placeholders
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ShimmerLoadingWidget(),
                );
              },
            );
          } else if (state is HadithLoaded) {
            if (state.hadiths.isEmpty) {
              return const Center(child: Text('No hadiths available.'));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.hadiths.length,
              itemBuilder: (context, index) {
                final hadithOrAyaModel = state.hadiths[index];
                bool showHadith = hadithOrAyaModel.hadith != null;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HadithOrAyahWidget(
                    hadithOrAyah: hadithOrAyaModel,
                    showHadith: showHadith,
                  ),
                );
              },
            );
          } else if (state is HadithFailed) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}

// ✅ Shimmer Loading Widget (Only for loading state)
class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}
