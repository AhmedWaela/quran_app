import 'package:equatable/equatable.dart';

import 'edition.dart';
import 'surah.dart';

class Data extends Equatable {
  final int? number;
  final String? audio;
  final List<dynamic>? audioSecondary;
  final String? text;
  final Edition? edition;
  final Surah? surah;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;

  const Data({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.edition,
    this.surah,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
  });

  factory Data.fromMap(Map<String, dynamic> json) {
    return Data(
      number: json['number'] as int?,
      audio: json['audio'] as String?,
      audioSecondary: json['audioSecondary'] as List<dynamic>?,
      text: json['text'] as String?,
      edition: json['edition'] == null
          ? null
          : Edition
              .fromCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse(
                  json['edition'] as Map<String, dynamic>),
      surah: json['surah'] == null
          ? null
          : Surah
              .fromCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse(
                  json['surah'] as Map<String, dynamic>),
      numberInSurah: json['numberInSurah'] as int?,
      juz: json['juz'] as int?,
      manzil: json['manzil'] as int?,
      page: json['page'] as int?,
      ruku: json['ruku'] as int?,
      hizbQuarter: json['hizbQuarter'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'audio': audio,
      'audioSecondary': audioSecondary,
      'text': text,
      'edition': edition
          ?.toCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse(),
      'surah': surah
          ?.toCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse(),
      'numberInSurah': numberInSurah,
      'juz': juz,
      'manzil': manzil,
      'page': page,
      'ruku': ruku,
      'hizbQuarter': hizbQuarter,
    };
  }

  @override
  List<Object?> get props {
    return [
      number,
      audio,
      audioSecondary,
      text,
      edition,
      surah,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
    ];
  }
}
