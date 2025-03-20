import 'package:equatable/equatable.dart';

import 'edition.dart';
import 'surah.dart';

class Data extends Equatable {
  final List<Surah>? surahs;
  final Edition? edition;

  const Data({this.surahs, this.edition});

  factory Data.fromMap(Map<String, dynamic> json) {
    return Data(
      surahs: (json['surahs'] as List<dynamic>?)
          ?.map((e) => Surah.fromMap(e as Map<String, dynamic>))
          .toList(),
      edition: json['edition'] == null
          ? null
          : Edition.fromMap(json['edition'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [surahs, edition];
}
