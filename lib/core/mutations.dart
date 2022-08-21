import 'package:coolmovies/core/models/review.dart';

class GraphQLMutations {
  String createMovieReview(
    String movieId,
    String userReviewerId,
    Review review,
  ) =>
      r'''
          mutation CreateMovieReview($reviewTitle: String!,$reviewBody: String!, $reviewRating: Int!, $reviewMovieId: UUID!, $userReviewerId: UUID! ) {
            createMovieReview(input: {
              movieReview: {
                title: $reviewTitle,
                body: $reviewBody,
                rating: $reviewRating,
                movieId: $reviewMovieId,
                userReviewerId: $userReviewerId
              }})
            {
              movieReview {
                id
                title
                body
                rating
                movieByMovieId {
                  title
                }
                userByUserReviewerId {
                  name
                }
              }
            }
          }
        ''';
}
