import 'package:coolmovies/utils/themes/default_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  final ThemeData _themeData = DefaultTheme.themeData.copyWith();
  ThemeData get themeData => _themeData;
}
