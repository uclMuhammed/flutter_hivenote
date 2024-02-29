import 'package:flutter/material.dart';
import 'package:flutter_hivenote/note/item/note_item.dart';
import 'package:flutter_hivenote/note/service/note_service.dart';
import 'package:flutter_hivenote/note/setup/setupLocator.dart';
import 'package:flutter_hivenote/theme/provider/theme_provider.dart';
import 'package:flutter_hivenote/view/note_list_page/note_list_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(NoteItemAdapter());
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final NoteService _noteService = NoteService();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: FutureBuilder(
              future: _noteService.getAllNotes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const NoteListPage();
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
