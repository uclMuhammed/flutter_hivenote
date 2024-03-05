import 'package:core/model/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hivenote/view/note/note_list/note_list.dart';
import 'package:flutter_hivenote/widget/note_add_button/note_add_button.dart';
import 'package:provider/provider.dart';
import 'package:theme/index.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final NoteService noteService = NoteService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HiveNote'),
        centerTitle: true,
        actions: [
          themeNotifier.isDarkMode
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
          Switch(
            value: themeNotifier.isDarkMode,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (_) {
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),
      body: NoteList(
        noteService: noteService,
      ),
      floatingActionButton: const NoteAddButton(),
    );
  }
}
