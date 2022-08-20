import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/queries.dart';

import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_view_model.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class HomeViewModel extends BaseViewModel {
  final GraphQLClient graphQLClient;
  HomeViewModel({required this.graphQLClient});

  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  @override
  Future<void> onModelReady() async {
    await fetchMovies();
  }

  Future<void> fetchMovies() async {
    final QueryResult result = await graphQLClient.query(
      QueryOptions(
        document: gql(
          GraphQLQueries.getAllMoviesWithReviews(),
        ),
      ),
    );
    if (result.hasException) {
      viewState = ViewState.ERROR;
    } else {
      final _moviesMap = result.data!['allMovies']['nodes'];
      _movies = _moviesMap.map<Movie>((map) => Movie.fromMap(map)).toList();
      viewState = ViewState.SUCCESS;
      notifyListeners();
    }
  }
}
