import 'package:coolmovies/utils/app_routes.dart';
import 'package:coolmovies/utils/svg_pictures.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      showFAB: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Text(
                'CoolMovies',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.home,
                      ),
                      child: Text(AppLocalizations.of(context)!.loginButton),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.signUpButton),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                SvgPictures.wave,
                alignment: Alignment.bottomCenter,
              )
            ],
          );
        },
      ),
    );
  }
}
