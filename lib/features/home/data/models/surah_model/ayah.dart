import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final int? number;
  final String? audio;
  final List<dynamic>? audioSecondary;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  const Ayah({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Ayah.fromNumber1NameEnglishNameAlFaatihaEnglishNameTranslationTheOpeningRevelationTypeMeccanAyahsNumber1AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy1Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy1Mp3TextNumberInSurah1Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber2AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy2Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy2Mp3TextNumberInSurah2Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber3AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy3Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy3Mp3TextNumberInSurah3Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber4AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy4Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy4Mp3TextNumberInSurah4Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber5AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy5Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy5Mp3TextNumberInSurah5Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber6AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy6Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy6Mp3TextNumberInSurah6Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber7AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy7Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy7Mp3TextNumberInSurah7Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalse(
      Map<String, dynamic> json) {
    return Ayah(
      number: json['number'] as int?,
      audio: json['audio'] as String?,
      audioSecondary: json['audioSecondary'] as List<dynamic>?,
      text: json['text'] as String?,
      numberInSurah: json['numberInSurah'] as int?,
      juz: json['juz'] as int?,
      manzil: json['manzil'] as int?,
      page: json['page'] as int?,
      ruku: json['ruku'] as int?,
      hizbQuarter: json['hizbQuarter'] as int?,
    );
  }

  Map<String, dynamic>
      toNumber1NameEnglishNameAlFaatihaEnglishNameTranslationTheOpeningRevelationTypeMeccanAyahsNumber1AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy1Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy1Mp3TextNumberInSurah1Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber2AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy2Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy2Mp3TextNumberInSurah2Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber3AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy3Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy3Mp3TextNumberInSurah3Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber4AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy4Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy4Mp3TextNumberInSurah4Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber5AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy5Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy5Mp3TextNumberInSurah5Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber6AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy6Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy6Mp3TextNumberInSurah6Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalseNumber7AudioHttpsCdnIslamicNetworkQuranAudio128ArAlafasy7Mp3AudioSecondaryHttpsCdnIslamicNetworkQuranAudio64ArAlafasy7Mp3TextNumberInSurah7Juz1Manzil1Page1Ruku1HizbQuarter1SajdaFalse() {
    return {
      'number': number,
      'audio': audio,
      'audioSecondary': audioSecondary,
      'text': text,
      'numberInSurah': numberInSurah,
      'juz': juz,
      'manzil': manzil,
      'page': page,
      'ruku': ruku,
      'hizbQuarter': hizbQuarter,
      'sajda': sajda,
    };
  }

  @override
  List<Object?> get props {
    return [
      number,
      audio,
      audioSecondary,
      text,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
      sajda,
    ];
  }
}
