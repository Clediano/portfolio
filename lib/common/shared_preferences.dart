import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> setPrefsTheme(String string) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('theme', string);
}

Future<String?> getPrefsTheme() async {
  return SharedPreferences.getInstance().then((SharedPreferences prefs) {
    if (prefs.getString('theme') != null) {
      return prefs.getString('theme');
    }
    return "dark";
  });
}

Future<void> setPrefsDefaultSystemLocale(String locale) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('locale', locale);
}

Future<String?> getPrefsDefaultSystemLocale() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('locale') != null ? pref.getString('locale') : "en";
}
