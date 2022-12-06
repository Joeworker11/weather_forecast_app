import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;  // sötét és fehér mód - _themeMode privátban hívjuk meg

  get themeMode => _themeMode;   // lehívjuk a themeMode-ot privátban

  toggleTheme(bool isDark){
    _themeMode = isDark?ThemeMode.dark:ThemeMode.light;
    notifyListeners(); // + ez felel azért hogy működjön a kapcsoló kapcsoló kondiciója - ha a themeMode fekete sötét lesz, ha fehér akkor világos
  }
}