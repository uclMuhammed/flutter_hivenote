// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteItemAdapter extends TypeAdapter<NoteItem> {
  @override
  final int typeId = 1;

  @override
  NoteItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteItem(
      fields[0] as String,
      fields[1] as String,
      checkBox: fields[4] == null ? false : fields[4] as bool,
      favorite: fields[2] == null ? false : fields[2] as bool,
      showDescription: fields[3] == null ? false : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NoteItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.favorite)
      ..writeByte(3)
      ..write(obj.showDescription)
      ..writeByte(4)
      ..write(obj.checkBox);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
