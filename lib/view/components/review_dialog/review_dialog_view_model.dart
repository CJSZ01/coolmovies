import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/models/user.dart';
import 'package:coolmovies/core/repositories/implementations/review_repository_implementation.dart';
import 'package:coolmovies/core/repositories/review_repository.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/utils/either.dart';
import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReviewDialogViewModel extends BaseViewModel {
  final Movie _movie;
  final GraphQLClient graphQLClient;

  ReviewDialogViewModel(
    this._movie,
    this.graphQLClient,
  ) : _reviewRepository = IReviewRepository(graphQLClient);
  Movie get movie => _movie;

  final TextEditingController _reviewTitleController = TextEditingController();
  TextEditingController get reviewTitleController => _reviewTitleController;
  final TextEditingController _reviewBodyController = TextEditingController();
  TextEditingController get reviewBodyController => _reviewBodyController;
  double reviewRating = 0;
  final ReviewRepository _reviewRepository;

  @override
  Future<void> onModelReady() {
    viewState = ViewState.SUCCESS;
    return super.onModelReady();
  }

  Future<Either<OperationException, Review>> submitReview() async {
    viewState = ViewState.LOADING;
    notifyListeners();
    Review review = Review(
        body: reviewBodyController.text,
        title: reviewTitleController.text,
        rating: reviewRating.toInt(),
        //TODO: Implement real user
        user: User(name: '', id: '5f1e6707-7c3a-4acd-b11f-fd96096abd5a'));
    final response = await _reviewRepository.createMovieReview(movie, review);
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
}
