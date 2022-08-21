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

  static String getAllMoviesWithReviews() => r'''
query {
  allMovies {
    nodes {
      id
      title
			releaseDate
			imgUrl
			movieDirectorByMovieDirectorId{
			name
		}
			movieReviewsByMovieId{nodes{title, body, rating}
			}
    }
    pageInfo {
      hasNextPage
      hasPreviousPage
    }
		
  }
}''';

  static String getMovieReviewsByMovie(String movieId) => '''
          query{
  allMovieReviews(
    filter: {movieId: {equalTo: "$movieId"}}
  ) {
    nodes {
      title
      body
      rating
      userByUserReviewerId{ id, name}
     
    }
  }
}
        ''';
}
