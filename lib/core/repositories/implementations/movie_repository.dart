import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/queries.dart';
import 'package:coolmovies/core/repositories/interfaces/movie_repository_interface.dart';
import 'package:coolmovies/utils/either.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieRepository implements IMovieRepository {
  final GraphQLClient _graphQLClient;

  MovieRepository(this._graphQLClient);

  @override
  Future<Either<OperationException, List<Movie>>> getAllMovies() async {
    final QueryResult result = await _graphQLClient.query(
      QueryOptions(
        document: gql(
          GraphQLQueries.getAllMoviesWithReviews(),
        ),
      ),
    );
    if (result.hasException) {
      return Left(result.exception!);
    } else {
      final _moviesMap = result.data!['allMovies']['nodes'];
      final movies =
          _moviesMap.map<Movie>((map) => Movie.fromMap(map)).toList();
      return Right(movies);
    }
  }
}
