import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
  final int? id;
  final String? chapterNumber;
  final String? chapterEnglish;
  final String? chapterUrdu;
  final String? chapterArabic;
  final String? bookSlug;

  const Chapter({
    this.id,
    this.chapterNumber,
    this.chapterEnglish,
    this.chapterUrdu,
    this.chapterArabic,
    this.bookSlug,
  });

  factory Chapter.fromMap(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'] as int?,
      chapterNumber: json['chapterNumber'] as String?,
      chapterEnglish: json['chapterEnglish'] as String?,
      chapterUrdu: json['chapterUrdu'] as String?,
      chapterArabic: json['chapterArabic'] as String?,
      bookSlug: json['bookSlug'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chapterNumber': chapterNumber,
      'chapterEnglish': chapterEnglish,
      'chapterUrdu': chapterUrdu,
      'chapterArabic': chapterArabic,
      'bookSlug': bookSlug,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      chapterNumber,
      chapterEnglish,
      chapterUrdu,
      chapterArabic,
      bookSlug,
    ];
  }
}
