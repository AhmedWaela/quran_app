import 'package:equatable/equatable.dart';

class Edition extends Equatable {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;

  const Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory Edition.fromMap(Map<String, dynamic> json) {
    return Edition(
      identifier: json['identifier'] as String?,
      language: json['language'] as String?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
    );
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
    ];
  }
}
