import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/repositories/interfaces/movie_repository_interface.dart';

import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final IMovieRepository _repository;

  HomeViewModel(this._repository);

  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  @override
  Future<void> onModelReady() async {
    await fetchMovies();
  }

  Future<void> fetchMovies() async {
    final result = await _repository.getAllMovies();
    result.fold((l) {
      viewState = ViewState.ERROR;
      notifyListeners();
    }, (r) {
      _movies = r;
      viewState = ViewState.SUCCESS;
      notifyListeners();
    });
  }
}
