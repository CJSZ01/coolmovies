import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.movie),
          label: AppLocalizations.of(context)!.homeCatalogButton,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.reviews),
          label: AppLocalizations.of(context)!.homeReviewsButton,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: AppLocalizations.of(context)!.homeProfileButton,
        ),
      ],
    );
  }
}
