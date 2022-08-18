import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:coolmovies/view/pages/home/components/home_app_bar.dart';
import 'package:coolmovies/view/pages/home/components/home_bottom_navigation.dart';
import 'package:coolmovies/view/pages/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () =>
          HomeViewModel(graphQLClient: GraphQLProvider.of(context).value),
      onModelReady: (model) => model.fetchMovies(),
      builder: (context, viewModel, child) {
        switch (viewModel.viewState) {
          case ViewState.LOADING:
            return const BaseView.loading();
          case ViewState.ERROR:
            return BaseView.error(
              errorMessage: 'Ocorreu um erro ao carregar o catálogo',
            );
          case ViewState.SUCCESS:
            return BaseView(
              child: Center(
                child: Column(
                    children:
                        viewModel.movies.map((e) => Text(e.title)).toList()),
              ),
              appBar: HomeAppBar(title: 'O que vamos assistir hoje?'),
              bottomNavigationBar: const HomeBottomNavigation(),
            );
        }
      },
    );
  }
}
