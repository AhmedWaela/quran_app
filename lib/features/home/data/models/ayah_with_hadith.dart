import 'package:quran_app/features/home/data/models/hadith_model/hadith_model.dart';
import 'package:quran_app/features/home/data/models/today_ayah/today_ayah.dart';

class HadithOrAyah {
  final HadithModel? hadith;
  final TodayAyah ayah;

  HadithOrAyah({this.hadith, required this.ayah});

  factory HadithOrAyah.fromMap(Map<String, dynamic> map) {
    return HadithOrAyah(
      hadith: map['hadith'] != null ? HadithModel.fromMap(map['hadith']) : null,
      ayah: TodayAyah.fromMap(map['ayah']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "hadith": hadith?.toMap(),
      "ayah": ayah.toMap(),
    };
  }
}
