import 'package:coolmovies/utils/svg_pictures.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:coolmovies/view/pages/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => BaseView(
        showFAB: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'CoolMovies',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: model.pageController,
                  children: model.children,
                ),
              ),
            ),
            SvgPicture.asset(
              SvgPictures.wave,
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }
}
