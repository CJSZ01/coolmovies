import 'package:flutter/material.dart';

class AppLocaleNotifier extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;

  Future<void> toggleLocale() async {
    if (_appLocale == const Locale('en')) {
      _appLocale = const Locale('pt');
    } else {
      _appLocale = const Locale('en');
    }
    notifyListeners();
  }
}
