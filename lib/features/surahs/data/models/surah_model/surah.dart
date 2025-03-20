import 'package:equatable/equatable.dart';
import 'package:quran_app/features/surahs/data/models/surah_model/edition.dart';

import 'ayah.dart';

class Surah extends Equatable {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final int? numberOfAyahs;
  final List<Ayah>? ayahs;
  final Edition? edition;

  const Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
    this.numberOfAyahs,
    this.edition,
  });

  factory Surah.fromMap(Map<String, dynamic> json) {
    return Surah(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => Ayah.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      revelationType,
      ayahs,
    ];
  }
}
