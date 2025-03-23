// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HadithModelAdapter extends TypeAdapter<HadithModel> {
  @override
  final int typeId = 0;

  @override
  HadithModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HadithModel(
      id: fields[0] as int?,
      hadithNumber: fields[1] as String?,
      englishNarrator: fields[2] as String?,
      hadithEnglish: fields[3] as String?,
      hadithUrdu: fields[4] as String?,
      urduNarrator: fields[5] as String?,
      hadithArabic: fields[6] as String?,
      headingArabic: fields[7] as dynamic,
      headingUrdu: fields[8] as dynamic,
      headingEnglish: fields[9] as dynamic,
      chapterId: fields[10] as String?,
      bookSlug: fields[11] as String?,
      volume: fields[12] as String?,
      status: fields[13] as String?,
      book: fields[14] as Book?,
      chapter: fields[15] as Chapter?,
    );
  }

  @override
  void write(BinaryWriter writer, HadithModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hadithNumber)
      ..writeByte(2)
      ..write(obj.englishNarrator)
      ..writeByte(3)
      ..write(obj.hadithEnglish)
      ..writeByte(4)
      ..write(obj.hadithUrdu)
      ..writeByte(5)
      ..write(obj.urduNarrator)
      ..writeByte(6)
      ..write(obj.hadithArabic)
      ..writeByte(7)
      ..write(obj.headingArabic)
      ..writeByte(8)
      ..write(obj.headingUrdu)
      ..writeByte(9)
      ..write(obj.headingEnglish)
      ..writeByte(10)
      ..write(obj.chapterId)
      ..writeByte(11)
      ..write(obj.bookSlug)
      ..writeByte(12)
      ..write(obj.volume)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.book)
      ..writeByte(15)
      ..write(obj.chapter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HadithModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
