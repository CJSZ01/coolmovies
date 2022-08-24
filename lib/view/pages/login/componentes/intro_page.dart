import 'package:coolmovies/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.greetingsPageText,
          textAlign: TextAlign.center,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              AppRoutes.home,
            ),
            child: Text(AppLocalizations.of(context)!.loginButton),
          ),
        ),
      ],
    );
  }
}
