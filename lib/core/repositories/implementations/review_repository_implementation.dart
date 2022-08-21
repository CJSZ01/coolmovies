import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/models/user.dart';
import 'package:coolmovies/core/mutations.dart';
import 'package:coolmovies/core/queries.dart';
import 'package:coolmovies/core/repositories/review_repository.dart';
import 'package:coolmovies/utils/either.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class IReviewRepository implements ReviewRepository {
  final GraphQLClient graphQLClient;

  IReviewRepository(this.graphQLClient);

  @override
  Future<Either<OperationException, List<Review>>> getMovieReviews(
    Movie movie,
  ) async {
    final QueryResult result = await graphQLClient.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(
          GraphQLQueries.getMovieReviewsByMovie(movie.id),
        ),
      ),
    );
    if (result.hasException) {
      return Left(result.exception!);
    } else {
      final List<Review> reviews = result.data!['allMovieReviews']['nodes']
          .map<Review>(
            (reviewMap) => Review(
              title: reviewMap['title'],
              body: reviewMap['body'],
              rating: reviewMap['rating'],
              user: User.fromMap(reviewMap['userByUserReviewerId']),
            ),
          )
          .toList();
      return Right(reviews);
    }
  }

  @override
  Future<Either<OperationException, Review>> createMovieReview(
    Movie movie,
    Review review,
  ) async {
    final QueryResult result = await graphQLClient.mutate(
      MutationOptions(
        variables: {
          'reviewTitle': review.title,
          'reviewBody': review.body,
          'reviewRating': review.rating,
          'reviewMovieId': movie.id,
          'userReviewerId': review.user?.id ?? ''
        },
        document: gql(
          GraphQLMutations()
              .createMovieReview(movie.id, review.user!.id!, review),
        ),
      ),
    );
    if (result.hasException) {
      return Left(result.exception!);
    } else {
      return Right(
        Review.fromMap(result.data!['createMovieReview']['movieReview']),
      );
    }
  }
}
