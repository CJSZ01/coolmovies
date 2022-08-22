import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/utils/either.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class ReviewRepository {
  Future<Either<OperationException, List<Review>>> getMovieReviews(Movie movie);

  Future<Either<OperationException, Review>> createMovieReview(
    Movie movie,
    Review review,
  );

  Future<Either<OperationException, Review>> updateMovieReviewById(
    Review review,
  );
}
