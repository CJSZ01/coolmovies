import 'package:coolmovies/view/pages/home/home_view.dart';
import 'package:coolmovies/view/pages/login/login_view.dart';
import 'package:coolmovies/view/pages/movie_details/movie_details_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => _routes;

  static String get login => '/login';
  static String get home => '/home';
  static String get movieDetails => '/movie_details';

  static final _routes = <String, WidgetBuilder>{
    '/login': (context) => const LoginView(),
    '/home': (context) => const HomeView(),
    '/movie_details': (context) => const MovieDetailsView()
  };
}
