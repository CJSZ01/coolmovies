import 'dart:developer';

import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/repositories/interfaces/review_repository_interface.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieDetailsViewModel extends BaseViewModel {
  final Movie movie;
  final IReviewRepository reviewRepository;
  MovieDetailsViewModel({
    required this.reviewRepository,
    required this.movie,
  });

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  @override
  Future<void> onModelReady() async {
    await fetchMovieReviews();
    return super.onModelReady();
  }

  Future<void> fetchMovieReviews() async {
    final result = await reviewRepository.getMovieReviews(movie);
    result.fold((exception) {
      log(exception.toString());
      viewState = ViewState.ERROR;
      notifyListeners();
    }, (reviews) {
      _reviews = reviews
        ..sort(
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
        await reviewRepository.deleteMovieReviewById(deletingReview);
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
