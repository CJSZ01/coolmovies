import 'package:coolmovies/core/repositories/implementations/movie_repository.dart';
import 'package:coolmovies/core/repositories/implementations/review_repository.dart';
import 'package:coolmovies/view/pages/home/home_view.dart';
import 'package:coolmovies/view/pages/login/login_view.dart';
import 'package:coolmovies/view/pages/movie_details/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => _routes;

  static String get login => '/login';
  static String get home => '/home';
  static String get movieDetails => '/movie_details';

  static final _routes = <String, WidgetBuilder>{
    login: (context) => const LoginView(),
    home: (context) => HomeView(
          repository: MovieRepository(GraphQLProvider.of(context).value),
        ),
    movieDetails: (context) => MovieDetailsView(
          repository: ReviewRepository(GraphQLProvider.of(context).value),
        )
  };
}
