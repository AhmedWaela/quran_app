import 'package:equatable/equatable.dart';

import 'data.dart';

class SurahModel extends Equatable {
  final int? code;
  final String? status;
  final Data? data;

  const SurahModel({this.code, this.status, this.data});

  factory SurahModel.fromMap(Map<String, dynamic> json) {
    return SurahModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromMap(json['data'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [code, status, data];
}
