import 'package:coolmovies/utils/app_locale_notifier.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocaleNotifier localeNotifier =
        Provider.of<AppLocaleNotifier>(context);
    return BaseView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.profileLanguageSelect,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  localeNotifier.selectLocale(const Locale('en'));
                },
                child: const Text('English'),
              ),
              ElevatedButton(
                onPressed: () {
                  localeNotifier.selectLocale(const Locale('pt'));
                },
                child: const Text('Português'),
              ),
            ],
          )
        ],
      ),
      showFAB: false,
    );
  }
}
