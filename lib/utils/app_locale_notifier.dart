import 'package:flutter/material.dart';

class AppLocaleNotifier extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;

  Future<void> selectLocale(Locale locale) async {
    _appLocale = locale;
    notifyListeners();
  }
}
