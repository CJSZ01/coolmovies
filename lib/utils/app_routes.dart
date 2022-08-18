import 'package:coolmovies/view/pages/home/home_view.dart';
import 'package:coolmovies/view/pages/login/login_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => _routes;

  static String get login => '/login';
  static String get home => '/home';

  static final _routes = <String, WidgetBuilder>{
    '/login': (context) => const LoginView(),
    '/home': (context) => const HomeView(),
  };
}
