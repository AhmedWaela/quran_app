import 'package:flutter/material.dart';
import 'package:quran_app/features/home/data/models/surah_model/surah_model.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});
  static const String route = "surah_view";
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as SurahModel;
    return Scaffold(
      body: ListView.builder(
        itemCount: arguments.ayahs?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(arguments.ayahs?[index].text ?? ""),
          );
        },
      ),
    );
  }
}
