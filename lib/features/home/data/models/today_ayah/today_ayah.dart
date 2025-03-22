import 'package:equatable/equatable.dart';

import 'data.dart';

class TodayAyah extends Equatable {
  final Data? data;

  const TodayAyah({this.data});

  factory TodayAyah.fromMap(Map<String, dynamic> json) {
    return TodayAyah(
      data: Data.fromMap(json["data"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.toMap(),
    };
  }

  @override
  List<Object?> get props => [data];
}
