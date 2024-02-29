import 'package:hive/hive.dart';
part 'note_item.g.dart';

@HiveType(typeId: 1)
class NoteItem {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2, defaultValue: false)
  bool favorite;

  @HiveField(3, defaultValue: false)
  bool showDescription;

  @HiveField(4, defaultValue: false)
  bool checkBox;

  NoteItem(this.title, this.description,
      {this.checkBox = false,
      this.favorite = false,
      this.showDescription = false});
}
