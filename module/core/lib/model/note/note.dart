import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends HiveObject {
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

  Note({
    required this.title,
    required this.description,
    required this.checkBox,
    required this.favorite,
    required this.showDescription,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'] as String,
      description: json['description'] as String,
      favorite: json['favorite'] as bool,
      showDescription: json['showDescription'] as bool,
      checkBox: json['checkBox'] as bool,
    );
  }

  List<Object?> get props =>
      [title, description, favorite, showDescription, checkBox];

  Note fromJson(Map<String, dynamic> json) {
    return Note(
        title: json['title'] as String,
        description: json['description'] as String,
        checkBox: json['checkBox'] as bool,
        favorite: json['favorite'] as bool,
        showDescription: json['showDescription'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'favorite': favorite,
      'showDescription': showDescription,
      'checkBox': checkBox,
    };
  }
}
