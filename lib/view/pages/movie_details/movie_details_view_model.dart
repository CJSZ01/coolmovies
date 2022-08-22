import 'dart:developer';

import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
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
      _reviews.sort(
        (a, b) =>
            a.user!.name.toLowerCase().compareTo(b.user!.name.toLowerCase()),
      );
      viewState = ViewState.SUCCESS;
      notifyListeners();
    });
  }

  Future<OperationException?> deleteReview(
    Review deletingReview,
    int index,
  ) async {
    viewState = ViewState.LOADING;
    notifyListeners();
    final response =
        await _reviewRepository.deleteMovieReviewById(deletingReview);
    response.fold((exception) {
      viewState = ViewState.ERROR;
      notifyListeners();
      return exception;
    }, (deletedReviewId) {
      viewState = ViewState.SUCCESS;
      _reviews.removeAt(index);
      notifyListeners();
      deletedReviewId = deletedReviewId;
    });
    return null;
  }

  void addReview(Review review) {
    _reviews.add(review);
    notifyListeners();
  }

  void updateReview(int index, Review review) {
    _reviews[index] = review;
    notifyListeners();
  }
}
