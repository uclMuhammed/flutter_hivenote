import 'package:core/model/note/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hivenote/view/note/note_list_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:theme/theme/app_theme/dark.dart';
import 'package:theme/theme/app_theme/light.dart';
import 'package:theme/theme/theme_notifier/theme_notifier.dart';

void main() async {
  /* WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(NoteItemAdapter());
  await Hive.openBox<NoteItem>('notes');
  await Hive.openBox('themeBox');
  setupLocator();
  runApp(const MyApp());
  */
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox('settings');
  await Hive.openBox<Note>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /* return ValueListenableBuilder(
      valueListenable: Hive.box('themeBox').listenable(),
      builder: (context, box, _) {
        bool isdarkMod = box.get('isdarkmode', defaultValue: false);
        return ChangeNotifierProvider<ThemeModel>(
          create: (_) => ThemeModel(isdarkMod),
          child: Consumer<ThemeModel>(
            builder: (context, theme, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme.isDarkMode.value
                    ? ThemeData.dark()
                    : ThemeData.light(),
                home: NoteListPage(),
              );
            },
          ),
        );
      },
    ); */
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(Hive.box('settings')),
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme.isDarkMode ? darkTheme : lightTheme,
            home: const NoteListScreen(),
          );
        },
      ),
    );
  }
}
