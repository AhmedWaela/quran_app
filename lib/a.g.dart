// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AAdapter extends TypeAdapter<A> {
  @override
  final int typeId = 1;

  @override
  A read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return A();
  }

  @override
  void write(BinaryWriter writer, A obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
