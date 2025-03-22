import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  final int? imsak;
  final int? fajr;
  final int? sunrise;
  final int? dhuhr;
  final int? asr;
  final int? maghrib;
  final int? sunset;
  final int? isha;
  final int? midnight;

  const Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromCode200StatusOkDataTimingsFajr0430Sunrise0557Dhuhr1202Asr1529Sunset1807Maghrib1807Isha1924Imsak0420Midnight0002Firstthird2204Lastthird0200DateReadable21Mar2025Timestamp1742533200HijriDate21091446FormatDdMmYyyyDay21WeekdayEnAlJumaAArMonthNumber9EnRamaNArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysLailatUlQadrAdjustedHolidaysMethodHjCoSaGregorianDate21032025FormatDdMmYyyyDay21WeekdayEnFridayMonthNumber3EnMarchYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
      Map<String, dynamic> json) {
    return Offset(
      imsak: json['Imsak'] as int?,
      fajr: json['Fajr'] as int?,
      sunrise: json['Sunrise'] as int?,
      dhuhr: json['Dhuhr'] as int?,
      asr: json['Asr'] as int?,
      maghrib: json['Maghrib'] as int?,
      sunset: json['Sunset'] as int?,
      isha: json['Isha'] as int?,
      midnight: json['Midnight'] as int?,
    );
  }

  Map<String, dynamic>
      toCode200StatusOkDataTimingsFajr0430Sunrise0557Dhuhr1202Asr1529Sunset1807Maghrib1807Isha1924Imsak0420Midnight0002Firstthird2204Lastthird0200DateReadable21Mar2025Timestamp1742533200HijriDate21091446FormatDdMmYyyyDay21WeekdayEnAlJumaAArMonthNumber9EnRamaNArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysLailatUlQadrAdjustedHolidaysMethodHjCoSaGregorianDate21032025FormatDdMmYyyyDay21WeekdayEnFridayMonthNumber3EnMarchYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {
      'Imsak': imsak,
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Maghrib': maghrib,
      'Sunset': sunset,
      'Isha': isha,
      'Midnight': midnight,
    };
  }

  @override
  List<Object?> get props {
    return [
      imsak,
      fajr,
      sunrise,
      dhuhr,
      asr,
      maghrib,
      sunset,
      isha,
      midnight,
    ];
  }
}
