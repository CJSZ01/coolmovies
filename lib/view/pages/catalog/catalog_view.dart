import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/repositories/interfaces/movie_repository_interface.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/utils/app_routes.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:coolmovies/view/pages/catalog/catalog_view_model.dart';

import 'package:coolmovies/view/pages/catalog/movie_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({
    required final IMovieRepository repository,
    Key? key,
  })  : _repository = repository,
        super(key: key);
  final IMovieRepository _repository;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CatalogViewModel>.reactive(
      viewModelBuilder: () => CatalogViewModel(_repository),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, viewModel, child) {
        switch (viewModel.viewState) {
          case ViewState.LOADING:
            return const BaseView.loading();
          case ViewState.ERROR:
            return BaseView.error(
              errorMessage: 'Ocorreu um erro ao carregar o catálogo',
            );
          case ViewState.SUCCESS:
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: GridView.builder(
                  physics: const PageScrollPhysics(),
                  itemCount: viewModel.movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final currentMovie = viewModel.movies[index];
                    return MovieTile(
                      title: currentMovie.title,
                      rating: currentMovie.getReviewAverage(),
                      imgUrl: currentMovie.imgUrl,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.movieDetails,
                        arguments: currentMovie,
                      ),
                    );
                  },
                ),
              ),
            );
        }
      },
    );
  }
}
