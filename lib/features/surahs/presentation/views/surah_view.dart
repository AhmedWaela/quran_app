import 'package:flutter/material.dart';
import 'package:quran_app/features/surahs/data/models/surah_model/surah.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key, required this.surah});
  final Surah surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(surah.name ?? ""),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Text(surah.ayahs?[index].text ?? "");
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.white,
            thickness: 3,
          );
        },
        itemCount: surah.ayahs?.length ?? 0,
      ),
    );
  }
}
