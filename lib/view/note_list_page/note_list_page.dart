import 'package:flutter/material.dart';
import 'package:flutter_hivenote/note/service/note_service.dart';
import 'package:flutter_hivenote/theme/provider/theme_provider.dart';
import 'package:flutter_hivenote/view/note_list_page/note_add_button/note_add_button.dart';
import 'package:flutter_hivenote/view/note_list_page/note_list/note_list.dart';
import 'package:provider/provider.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final NoteService noteService = NoteService();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HiveNote'),
          centerTitle: true,
          actions: [
            themeProvider.isDarkMode
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            Switch(
              value: themeProvider.isDarkMode,
              onChanged: (val) => themeProvider.toggleTheme(),
            ),
          ],
        ),
         body: NoteList(noteService: noteService),
        floatingActionButton: const NoteAddButton(),
      ),
    );
  }
}
