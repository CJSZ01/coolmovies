import 'package:coolmovies/view/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    required this.viewModel,
    Key? key,
  }) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: viewModel.selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.movie),
          label: AppLocalizations.of(context)!.homeCatalogButton,
        ),
        // BottomNavigationBarItem(
        //   icon: const Icon(Icons.reviews),
        //   label: AppLocalizations.of(context)!.homeReviewsButton,
        // ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: AppLocalizations.of(context)!.homeProfileButton,
        ),
      ],
      onTap: (index) {
        viewModel.changeIndex(index);
      },
    );
  }
}
