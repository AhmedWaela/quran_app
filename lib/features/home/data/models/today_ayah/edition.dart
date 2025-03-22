import 'package:equatable/equatable.dart';

class Edition extends Equatable {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;
  final dynamic direction;

  const Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  factory Edition.fromCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse(
      Map<String, dynamic> json) {
    return Edition(
      identifier: json['identifier'] as String?,
      language: json['language'] as String?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
      direction: json['direction'] as dynamic,
    );
  }

  Map<String, dynamic>
      toCode200StatusOkDataNumber262AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy262Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy262Mp3TextEditionIdentifierArAlafasyLanguageArNameEnglishNameAlafasyFormatAudioTypeVersebyverseDirectionNullSurahNumber2NameEnglishNameAlBaqaraEnglishNameTranslationTheCowNumberOfAyahs286RevelationTypeMedinanNumberInSurah255Juz3Manzil1Page42Ruku35HizbQuarter17SajdaFalse() {
    return {
      'identifier': identifier,
      'language': language,
      'name': name,
      'englishName': englishName,
      'format': format,
      'type': type,
      'direction': direction,
    };
  }

  @override
  List<Object?> get props {
    return [
      identifier,
      language,
      name,
      englishName,
      format,
      type,
      direction,
    ];
  }
}
