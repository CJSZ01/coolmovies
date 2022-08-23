import 'package:coolmovies/core/repositories/interfaces/movie_repository_interface.dart';
import 'package:coolmovies/view/components/base_app_bar.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:coolmovies/view/pages/home/components/home_bottom_navigation.dart';
import 'package:coolmovies/view/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  final IMovieRepository _repository;
  const HomeView({
    required final IMovieRepository repository,
    Key? key,
  })  : _repository = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      viewModelBuilder: () => HomeViewModel(_repository),
      builder: (context, model, child) {
        return BaseView(
          appBar: BaseAppBar(
            title: AppLocalizations.of(context)!.homeAppBarTitle,
          ),
          bottomNavigationBar: HomeBottomNavigation(viewModel: model),
          child: model.children[model.selectedIndex],
          showFAB: false,
        );
      },
    );
  }
}
