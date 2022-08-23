import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/utils/either.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class IMovieRepository {
  Future<Either<OperationException, List<Movie>>> getAllMovies();
}
