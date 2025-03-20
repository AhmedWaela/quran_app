import 'package:flutter/material.dart';
import '../../../data/models/surah_model/surah.dart';

class SurahListTileWidget extends StatelessWidget {
  const SurahListTileWidget({super.key, required this.surahModel});
  final Surah surahModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        child: Text(
          surahModel.number.toString(),
        ),
      ),
      title: Text("${surahModel.name} - ${surahModel.englishName}"),
      subtitle: Text(surahModel.englishNameTranslation ?? ""),
      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
    );
  }
}
