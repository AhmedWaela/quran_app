import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int? id;
  final String? bookName;
  final String? writerName;
  final dynamic aboutWriter;
  final String? writerDeath;
  final String? bookSlug;

  const Book({
    this.id,
    this.bookName,
    this.writerName,
    this.aboutWriter,
    this.writerDeath,
    this.bookSlug,
  });

  factory Book.fromMap(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int?,
      bookName: json['bookName'] as String?,
      writerName: json['writerName'] as String?,
      aboutWriter: json['aboutWriter'] as dynamic,
      writerDeath: json['writerDeath'] as String?,
      bookSlug: json['bookSlug'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bookName': bookName,
      'writerName': writerName,
      'aboutWriter': aboutWriter,
      'writerDeath': writerDeath,
      'bookSlug': bookSlug,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      bookName,
      writerName,
      aboutWriter,
      writerDeath,
      bookSlug,
    ];
  }
}
