import 'package:core/model/note/note.dart';
import 'package:core/model/service/service.dart';
import 'package:theme/theme/theme_notifier/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hivenote/view/note/note_edit_screen/note_edit_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
class NoteList extends StatefulWidget {
  const NoteList({super.key, required this.noteService});
  final NoteService noteService;
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) {
        return ValueListenableBuilder(
          valueListenable: Hive.box<Note>('notes').listenable(),
          builder: (context, box, _) {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                var note = box.getAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        theme.isDarkMode
                            ? const BoxShadow(
                                color: Colors.white10,
                                offset: Offset(-3, 3),
                                blurRadius: 2,
                              )
                            : const BoxShadow(
                                color: Colors.black45,
                                offset: Offset(-3, 3),
                                blurRadius: 2,
                              )
                      ],
                    ),
                    child: Slidable(
                      key: const ValueKey(0),
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteEditScreen(
                                  index: index,
                                  note: note,
                                ),
                              ),
                            );
                          },
                          backgroundColor: Theme.of(context).hintColor,
                          icon: Icons.edit,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) {
                            widget.noteService.deleteNote(index);
                          },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                      ]),
                      child: ListTile(
                        title: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.expand_more),
                              onPressed: () {
                                note!.showDescription = note.showDescription;
                                widget.noteService.showDescription(index, note);
                              },
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                note!.title,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Checkbox(
                              value: note.checkBox,
                              onChanged: (val) =>
                                  widget.noteService.checkbox(index, note),
                            ),
                          ],
                        ),
                        subtitle: note.showDescription
                            ? Text(note.description)
                            : null,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
