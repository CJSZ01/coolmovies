import 'package:coolmovies/utils/app_locale_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({
    required this.toNextPage,
    Key? key,
  }) : super(key: key);

  final VoidCallback toNextPage;

  @override
  Widget build(BuildContext context) {
    final AppLocaleNotifier localeNotifier =
        Provider.of<AppLocaleNotifier>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Hey there! First things first, please pick your language!',
          textAlign: TextAlign.center,
        ),
        const Divider(),
        const Text(
          'E aí! Antes de qualquer coisa, por favor, selecione seu idioma!',
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                localeNotifier.selectLocale(const Locale('pt'));
              },
              child: const Text('Português'),
            ),
            ElevatedButton(
              onPressed: () {
                localeNotifier.selectLocale(const Locale('en'));
              },
              child: const Text('English'),
            )
          ],
        ),
        ElevatedButton(
          onPressed: toNextPage,
          child: Text(AppLocalizations.of(context)!.greetingsPageContinue),
        ),
      ],
    );
  }
}
