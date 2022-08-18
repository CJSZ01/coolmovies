import 'dart:developer';

import 'package:coolmovies/core/models/movie.dart';

import 'package:coolmovies/core/view_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeViewModel extends ChangeNotifier {
  final GraphQLClient graphQLClient;
  HomeViewModel({required this.graphQLClient});

  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  ViewState _viewState = ViewState.LOADING;
  ViewState get viewState => _viewState;

  Future<void> fetchMovies() async {
    await Future.delayed(Duration(seconds: 3));
    final QueryResult result = await graphQLClient.query(
      QueryOptions(
        document: gql(
          r'''
          query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                movieDirectorId
                userCreatorId
                title
                releaseDate
                nodeId
                userByUserCreatorId {
                  id
                  name
                  nodeId
                }
              }
            }
          }
        ''',
        ),
      ),
    );
    if (result.hasException) {
      _viewState = ViewState.ERROR;
    } else {
      _movies = result.data!['allMovies']['nodes']
          .map<Movie>(
            (movie) => Movie(
              id: movie['id'],
              title: movie['title'],
              releaseDate: movie['releaseDate'],
              imgUrl: movie['releaseDate'],
            ),
          )
          .toList();
      _viewState = ViewState.SUCCESS;
      notifyListeners();
    }
  }
}
