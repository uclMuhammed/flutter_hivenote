import 'package:flutter_hivenote/theme/model/theme_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ThemeService {
  late Box<ThemeModel> _themeBox;

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(ThemeModelAdapter());
    _themeBox = await Hive.openBox<ThemeModel>('theme');
  }

  ThemeModel getTheme() {
    return _themeBox.get(0, defaultValue: ThemeModel(isDarkMode: false))!;
  }

  Future<void> setTheme(ThemeModel theme) async {
    await _themeBox.put(0, theme);
  }
}
