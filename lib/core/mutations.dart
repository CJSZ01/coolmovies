class GraphQLMutations {
  String get createMovieReview => r'''
          mutation CreateMovieReview($reviewTitle: String!,$reviewBody: String!, $reviewRating: Int!, $reviewMovieId: UUID!, $userReviewerId: UUID!) {
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

  String get updateMovieReviewById => r'''
mutation UpdateMovieReviewById($reviewTitle: String!,$reviewBody: String!, $reviewRating: Int!, $reviewId: UUID!) {
	updateMovieReviewById(
		input: {
			id : $reviewId,
			movieReviewPatch: {
			  title: $reviewTitle,
        body: $reviewBody,
        rating: $reviewRating,
			}
		}
	) {
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
