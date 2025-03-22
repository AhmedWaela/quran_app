import 'package:equatable/equatable.dart';

import 'ayah.dart';

class SurahModel extends Equatable {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayah>? ayahs;

  const SurahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory SurahModel.fromMap(Map<String, dynamic> json) {
    return SurahModel(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => Ayah
              .fromNumber1NameEnglishNameAlFaatihaEnglishNameTranslationTheOpeningRevelationTypeMeccanAyahsNumber1AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy1Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy1Mp3TextNumberInSurah1Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber2AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy2Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy2Mp3TextNumberInSurah2Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber3AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy3Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy3Mp3TextNumberInSurah3Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber4AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy4Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy4Mp3TextNumberInSurah4Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber5AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy5Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy5Mp3TextNumberInSurah5Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber6AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy6Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy6Mp3TextNumberInSurah6Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber7AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy7Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy7Mp3TextNumberInSurah7Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalse(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'revelationType': revelationType,
      'ayahs': ayahs
          ?.map((e) => e
              .toNumber1NameEnglishNameAlFaatihaEnglishNameTranslationTheOpeningRevelationTypeMeccanAyahsNumber1AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy1Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy1Mp3TextNumberInSurah1Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber2AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy2Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy2Mp3TextNumberInSurah2Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber3AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy3Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy3Mp3TextNumberInSurah3Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber4AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy4Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy4Mp3TextNumberInSurah4Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber5AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy5Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy5Mp3TextNumberInSurah5Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber6AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy6Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy6Mp3TextNumberInSurah6Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber7AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy7Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy7Mp3TextNumberInSurah7Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalse())
          .toList(),
    };
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
