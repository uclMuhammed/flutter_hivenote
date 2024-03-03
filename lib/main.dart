import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hivenote/note/item/note_item.dart';
import 'package:flutter_hivenote/note/setup/setupLocator.dart';
import 'package:flutter_hivenote/theme/model/theme_model.dart';
import 'package:flutter_hivenote/view/note/note_list_page/note_list_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(NoteItemAdapter());
  await Hive.openBox<NoteItem>('notes');
  await Hive.openBox('themeBox');
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
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
    );
  }
}
