import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/features/home/data/models/today_ayah/today_ayah.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/hadiths_cubit.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/today_ayah_cubit.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/today_hadith_cubit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'widgets/stories_list_view.dart';
import 'widgets/home_view_app_bar.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeViewAppBar(),
            BlocProvider(
              create: (context) => HadithsCubit()..getHadithsAndAyahs(),
              child: StoriesListView(),
            ),
            RamadanKareemWidget(),
            BlocProvider(
              create: (context) => TodayAyahCubit()..getTodayAyah(),
              child: TodayAyahWidget(),
            ),
            BlocProvider(
              create: (context) => TodayHadithCubit()..getHadith(),
              child: TodayHadith(),
            ),
          ],
        ),
      ),
    );
  }
}

class TodayHadith extends StatelessWidget {
  const TodayHadith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocBuilder<TodayHadithCubit, TodayHadithState>(
        builder: (context, state) {
          if (state is TodayHadithLoading) {
            return TodayAyahShimmer();
          }
          if (state is TodayHadithLoaded) {
            return Column(
              children: [
                CustomCard(
                  text: state.hadithModel.hadithArabic ?? "",
                  text2: state.hadithModel.chapter?.chapterArabic ?? "",
                  label: "حديث اليوم",
                )
              ],
            );
          }
          if (state is TodayHaduthFailed) {
            return Text(state.message);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

class RamadanKareemWidget extends StatelessWidget {
  const RamadanKareemWidget({super.key});

  final String imageUrl =
      "https://tse2.mm.bing.net/th?id=OIP.4i73GOXCUjBMsG5i37Jj1gHaES&pid=Api&P=0&h=220";
  final String text = "رمضان كريم 🌙✨\nاللهم بلغنا رمضان واجعلنا من عتقائه 🤲";

  Future<void> _shareImageWithText(String imageUrl, String text) async {
    try {
      final uri = Uri.parse(imageUrl);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/ramadan_image.jpg');
        await file.writeAsBytes(bytes);

        await Share.shareXFiles([XFile(file.path)], text: text);
      } else {
        print("Failed to download image.");
      }
    } catch (e) {
      print("Error sharing image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          CustomRow(
            onPressed: () {
              _shareImageWithText(imageUrl, text);
            },
            label: "رمضان كريم",
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 250,
              width: MediaQuery.sizeOf(context)
                  .width, // Ensure the width matches the parent
              child: Image.network(
                "https://tse2.mm.bing.net/th?id=OIP.4i73GOXCUjBMsG5i37Jj1gHaES&pid=Api&P=0&h=220",
                fit: BoxFit.cover, // Ensure the image covers the SizedBox
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    // Show a loading placeholder
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300], // Loading background color
                      ),
                    );
                  }
                  return child; // Return the image once it's loaded
                },
                errorBuilder: (context, error, stackTrace) {
                  // Handle image loading errors
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300], // Error background color
                    ),
                    child: const Icon(Icons.error,
                        color: Colors.red), // Error icon
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TodayAyahWidget extends StatelessWidget {
  const TodayAyahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: BlocBuilder<TodayAyahCubit, TodayAyahState>(
        builder: (context, state) {
          if (state is TodayAyahLoaded) {
            TodayAyah todayAyah = state.todayAyah;
            return CustomCard(
              text: todayAyah.data?.text ?? "",
              text2: todayAyah.data?.surah?.name ?? "",
              label: "اية اليوم",
            );
          } else if (state is TodayAyahLoading) {
            return const TodayAyahShimmer(); // ✅ Shimmer instead of ProgressIndicator
          } else if (state is TodayAyahFailed) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.text,
      required this.text2,
      required this.label});

  final String text;
  final String text2;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRow(
          onPressed: () async {
            await Share.share(text);
          },
          label: label,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    text2,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.share, color: Colors.black),
        ),
      ],
    );
  }
}

class TodayAyahShimmer extends StatelessWidget {
  const TodayAyahShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 18,
                width: 100,
                color: Colors.grey[300],
              ),
              const Spacer(),
              const Icon(Icons.share, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 14,
                    width: 100,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
