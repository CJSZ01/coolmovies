import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/models/user.dart';
import 'package:coolmovies/core/repositories/interfaces/review_repository_interface.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/utils/either.dart';
import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReviewDialogViewModel extends BaseViewModel {
  final Movie movie;
  final Review? editingReview;
  final IReviewRepository _repository;

  ReviewDialogViewModel({
    required this.movie,
    required final IReviewRepository reviewRepository,
    this.editingReview,
  }) : _repository = reviewRepository;

  final TextEditingController _reviewTitleController = TextEditingController();
  TextEditingController get reviewTitleController => _reviewTitleController;
  final TextEditingController _reviewBodyController = TextEditingController();
  TextEditingController get reviewBodyController => _reviewBodyController;
  double reviewRating = 0;

  @override
  Future<void> onModelReady() {
    if (editingReview != null) {
      _reviewTitleController.text = editingReview!.title;
      _reviewBodyController.text = editingReview!.body;
      reviewRating = editingReview!.rating.toDouble();
    }
    viewState = ViewState.SUCCESS;
    return super.onModelReady();
  }

  Future<Either<OperationException, Review>> createReview() async {
    viewState = ViewState.LOADING;
    notifyListeners();
    Review review = Review(
      id: '',
      body: reviewBodyController.text,
      title: reviewTitleController.text,
      rating: reviewRating.toInt(),
      //TODO: Implement real user
      user: User(name: '', id: '5f1e6707-7c3a-4acd-b11f-fd96096abd5a'),
    );
    final response = await _repository.createMovieReview(movie, review);
    response.fold((exception) {
      viewState = ViewState.ERROR;
      notifyListeners();
      return Left(exception);
    }, (createdReview) {
      viewState = ViewState.SUCCESS;
      notifyListeners();
      review = createdReview;
    });
    return Right(review);
  }

  Future<Either<OperationException, Review>> updateReview() async {
    viewState = ViewState.LOADING;
    notifyListeners();
    var updatingReview = editingReview!.copyWith(
      body: _reviewBodyController.text,
      title: _reviewTitleController.text,
      rating: reviewRating.toInt(),
    );
    final response = await _repository.updateMovieReviewById(updatingReview);
    response.fold((exception) {
      viewState = ViewState.ERROR;
      notifyListeners();
      return Left(exception);
    }, (createdReview) {
      viewState = ViewState.SUCCESS;
      notifyListeners();
      updatingReview = createdReview;
    });
    return Right(updatingReview);
  }
}
