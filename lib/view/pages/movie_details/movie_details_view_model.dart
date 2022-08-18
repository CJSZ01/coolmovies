import 'dart:developer';

import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/queries.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieDetailsViewModel extends BaseViewModel {
  final Movie movie;
  final GraphQLClient graphQLClient;
  MovieDetailsViewModel({required this.movie, required this.graphQLClient});

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  @override
  Future<void> onModelReady() async {
    await fetchMovieReviews();

    return super.onModelReady();
  }

  Future<void> fetchMovieReviews() async {
    final QueryResult result = await graphQLClient.query(
      QueryOptions(
        document: gql(
          GraphQLQueries.getMovieReviewsByMovie(movie.id),
        ),
      ),
    );
    if (result.hasException) {
      log(result.exception.toString());
      viewState = ViewState.ERROR;
    } else {
      _reviews = result.data!['allMovieReviews']['nodes']
          .map<Review>((reviewMap) => Review(
              title: reviewMap['title'],
              body: reviewMap['body'],
              rating: reviewMap['rating']))
          .toList();
      viewState = ViewState.SUCCESS;
    }
    notifyListeners();
    log(reviews.toString());
  }
}
