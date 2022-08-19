class GraphQLQueries {
  static String get getAllMovies => r'''
          query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                movieDirectorId
                userCreatorId
                title
                releaseDate
                nodeId
                movieDirectorByMovieDirectorId{
		          	  name
	              	}
                userByUserCreatorId {
                  id
                  name
                  nodeId
                }
              }
            }
          }
        ''';
  static String getMovieReviewsByMovie(String movieId) => '''
          query allMovieReviews {
            allMovieReviews(filter: {movieId: {equalTo: "$movieId"}}) {
              nodes {
                title
                body
                rating
              }
            }
          }
        ''';
}
