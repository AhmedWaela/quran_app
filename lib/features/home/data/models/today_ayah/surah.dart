import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;

  const Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  factory Surah.fromCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse(
      Map<String, dynamic> json) {
    return Surah(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
      revelationType: json['revelationType'] as String?,
    );
  }

  Map<String, dynamic>
      toCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'numberOfAyahs': numberOfAyahs,
      'revelationType': revelationType,
    };
  }

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      numberOfAyahs,
      revelationType,
    ];
  }
}
