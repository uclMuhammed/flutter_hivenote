import 'package:core/model/note/note.dart';
import 'package:hive/hive.dart';

class NoteService {
  late final String _noteBox = 'notes';

  Future<Box<Note>> get _box async =>
      await Hive.openBox<Note>(_noteBox);

  Future<void> addNote(Note note) async {
    var box = await _box;
    await box.add(note);
  }

  Future<List<Note>> getAllNotes() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteNote(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<void> checkbox(int index, Note item) async {
    var box = await _box;
    item.checkBox = !item.checkBox;
    await box.putAt(index, item);
  }

  Future<void> showDescription(int index, Note item) async {
    var box = await _box;
    item.showDescription = !item.showDescription;
    await box.putAt(index, item);
  }

  Future<void> updateNote(int index, Note updateNote) async {
    var box = await _box;
    await box.putAt(index, updateNote);
  }
}