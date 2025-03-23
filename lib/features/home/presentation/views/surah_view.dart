import 'package:flutter/material.dart';
import 'package:quran_app/features/home/data/models/surah_model/surah_model.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});
  static const String route = "surah_view";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as SurahModel;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "بسم الله الرحمن الرحيم",
                  style: const TextStyle(
                      fontFamily: "Diwani",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  String ayahText = arguments.ayahs?[index].text ?? "";

                  if (index == 0) {
                    ayahText = ayahText.replaceAll(
                        "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", "");
                  }

                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          ayahText,
                          style: const TextStyle(fontSize: 24),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
                childCount: arguments.ayahs?.length ?? 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
