import 'package:flutter_hivenote/note/item/note_item.dart';
import 'package:hive/hive.dart';

class NoteService {
  late String _noteBox = 'notes';

  Future<Box<NoteItem>> get _box async =>
      await Hive.openBox<NoteItem>(_noteBox);

  Future<void> addNote(NoteItem note) async {
    var box = await _box;
    await box.add(note);
  }

  Future<List<NoteItem>> getAllNotes() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteNote(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<void> checkbox(int index, NoteItem item) async {
    var box = await _box;
    item.checkBox = !item.checkBox;
    await box.putAt(index, item);
  }

  Future<void> showDescription(int index, NoteItem item) async {
    var box = await _box;
    item.showDescription = !item.showDescription;
    await box.putAt(index, item);
  }

  Future<void> updateNote(int index, NoteItem updateNote) async {
    var box = await _box;
    await box.putAt(index, updateNote);
  }
}
