import 'package:flutter/material.dart';
import 'package:quran_app/features/home/data/models/ayah_with_hadith.dart';
import 'package:quran_app/features/home/presentation/views/story_view.dart';

class HadithOrAyahWidget extends StatelessWidget {
  const HadithOrAyahWidget({
    super.key,
    required this.hadithOrAyah,
    required this.showHadith,
  });

  final HadithOrAyah hadithOrAyah;
  final bool showHadith;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, StoryView.route,
            arguments: [hadithOrAyah, showHadith]);
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.green,
        child: CircleAvatar(
          radius: 48,
          backgroundColor: Colors.white,
          child: Text(
            showHadith ? "حديث" : "آية", // عرض النص بناءً على الحالة
            style: const TextStyle(fontSize: 26, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
