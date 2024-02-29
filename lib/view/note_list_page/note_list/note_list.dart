import 'package:flutter/material.dart';
import 'package:flutter_hivenote/note/item/note_item.dart';
import 'package:flutter_hivenote/note/service/note_service.dart';
import 'package:flutter_hivenote/theme/provider/theme_provider.dart';
import 'package:flutter_hivenote/view/note_edit_page/note_edit_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
    required this.noteService,
  });

  final NoteService noteService;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ValueListenableBuilder(
      valueListenable: Hive.box<NoteItem>('notes').listenable(),
      builder: (context, box, _) {
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            var note = box.getAt(index);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode
                      ? Colors.deepPurple
                      : Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(-2, 2),
                      blurRadius: 2,
                    ),
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
                            builder: (context) => NoteEditPage(
                              index: index,
                              note: note,
                            ),
                          ),
                        );
                      },
                      backgroundColor: Colors.deepPurple,
                      icon: Icons.edit,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    SlidableAction(
                      flex: 1,
                      onPressed: (context) {
                        noteService.deleteNote(index);
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
                          icon: Icon(Icons.expand_more),
                          onPressed: () {
                            note!.showDescription = note.showDescription;
                            noteService.showDescription(index, note);
                          },
                        ),
                        Text(note!.title),
                        Spacer(),
                        Checkbox(
                          value: note.checkBox,
                          onChanged: (val) => noteService.checkbox(index, note),
                        ),
                      ],
                    ),
                    subtitle:
                        note.showDescription ? Text(note.description) : null,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
