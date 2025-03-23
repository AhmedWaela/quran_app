import 'package:hive/hive.dart';

import 'book.dart';
import 'chapter.dart';

part "hadith_model.g.dart";

@HiveType(typeId: 0)
class HadithModel extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? hadithNumber;
  @HiveField(2)
  final String? englishNarrator;
  @HiveField(3)
  final String? hadithEnglish;
  @HiveField(4)
  final String? hadithUrdu;
  @HiveField(5)
  final String? urduNarrator;
  @HiveField(6)
  final String? hadithArabic;
  @HiveField(7)
  final dynamic headingArabic;
  @HiveField(8)
  final dynamic headingUrdu;
  @HiveField(9)
  final dynamic headingEnglish;
  @HiveField(10)
  final String? chapterId;
  @HiveField(11)
  final String? bookSlug;
  @HiveField(12)
  final String? volume;
  @HiveField(13)
  final String? status;
  @HiveField(14)
  final Book? book;
  @HiveField(15)
  final Chapter? chapter;

  HadithModel({
    this.id,
    this.hadithNumber,
    this.englishNarrator,
    this.hadithEnglish,
    this.hadithUrdu,
    this.urduNarrator,
    this.hadithArabic,
    this.headingArabic,
    this.headingUrdu,
    this.headingEnglish,
    this.chapterId,
    this.bookSlug,
    this.volume,
    this.status,
    this.book,
    this.chapter,
  });

  factory HadithModel.fromMap(json) {
    return HadithModel(
      id: json['id'] as int?,
      hadithNumber: json['hadithNumber'] as String?,
      englishNarrator: json['englishNarrator'] as String?,
      hadithEnglish: json['hadithEnglish'] as String?,
      hadithUrdu: json['hadithUrdu'] as String?,
      urduNarrator: json['urduNarrator'] as String?,
      hadithArabic: json['hadithArabic'] as String?,
      headingArabic: json['headingArabic'] as dynamic,
      headingUrdu: json['headingUrdu'] as dynamic,
      headingEnglish: json['headingEnglish'] as dynamic,
      chapterId: json['chapterId'] as String?,
      bookSlug: json['bookSlug'] as String?,
      volume: json['volume'] as String?,
      status: json['status'] as String?,
      book: json['book'] == null
          ? null
          : Book.fromMap(json['book'] as Map<String, dynamic>),
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromMap(json['chapter'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hadithNumber': hadithNumber,
      'englishNarrator': englishNarrator,
      'hadithEnglish': hadithEnglish,
      'hadithUrdu': hadithUrdu,
      'urduNarrator': urduNarrator,
      'hadithArabic': hadithArabic,
      'headingArabic': headingArabic,
      'headingUrdu': headingUrdu,
      'headingEnglish': headingEnglish,
      'chapterId': chapterId,
      'bookSlug': bookSlug,
      'volume': volume,
      'status': status,
      'book': book?.toMap(),
      'chapter': chapter?.toMap()
    };
  }
}
