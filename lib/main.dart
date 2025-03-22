import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/views/story_view.dart';
import 'package:quran_app/features/home/presentation/views/surah_view.dart';
import 'features/home/presentation/views/navigation_view.dart';

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatefulWidget {
  const QuranApp({super.key});

  @override
  State<QuranApp> createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Arabic"),
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationView.route,
      routes: {
        StoryView.route: (c) => const StoryView(),
        NavigationView.route: (c) => const NavigationView(),
        SurahView.route: (c) => const SurahView()
      },
    );
  }
}
