import 'dart:developer';

import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/models/user.dart';
import 'package:coolmovies/core/queries.dart';
import 'package:coolmovies/core/repositories/implementations/review_repository_implementation.dart';
import 'package:coolmovies/core/repositories/review_repository.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieDetailsViewModel extends BaseViewModel {
  final Movie movie;
  final GraphQLClient graphQLClient;
  final ReviewRepository _reviewRepository;
  MovieDetailsViewModel({required this.movie, required this.graphQLClient})
      : _reviewRepository = IReviewRepository(graphQLClient);

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  @override
  Future<void> onModelReady() async {
    await fetchMovieReviews();

    return super.onModelReady();
  }

  Future<void> fetchMovieReviews() async {
    final result = await _reviewRepository.getMovieReviews(movie);
    result.fold((exception) {
      log(exception.toString());
      viewState = ViewState.ERROR;
      notifyListeners();
    }, (reviews) {
      _reviews = reviews;
      viewState = ViewState.SUCCESS;
      notifyListeners();
    });
  }

  void addReview(Review review) {
    _reviews.add(review);
    notifyListeners();
  }
}
