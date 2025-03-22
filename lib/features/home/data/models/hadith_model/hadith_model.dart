import 'package:equatable/equatable.dart';

import 'book.dart';
import 'chapter.dart';

class HadithModel extends Equatable {
  final int? id;
  final String? hadithNumber;
  final String? englishNarrator;
  final String? hadithEnglish;
  final String? hadithUrdu;
  final String? urduNarrator;
  final String? hadithArabic;
  final dynamic headingArabic;
  final dynamic headingUrdu;
  final dynamic headingEnglish;
  final String? chapterId;
  final String? bookSlug;
  final String? volume;
  final String? status;
  final Book? book;
  final Chapter? chapter;

  const HadithModel({
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

  @override
  List<Object?> get props {
    return [
      id,
      hadithNumber,
      englishNarrator,
      hadithEnglish,
      hadithUrdu,
      urduNarrator,
      hadithArabic,
      headingArabic,
      headingUrdu,
      headingEnglish,
      chapterId,
      bookSlug,
      volume,
      status,
      book,
      chapter,
    ];
  }
}
