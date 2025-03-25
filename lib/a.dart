import 'package:hive_flutter/hive_flutter.dart';
part 'a.g.dart';

@HiveType(typeId: 1)
class A extends HiveObject {
  @HiveType(typeId: 0)
  final String? text;

  A({this.text});
}
