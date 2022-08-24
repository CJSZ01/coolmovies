import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:coolmovies/view/pages/login/componentes/greetings_page.dart';
import 'package:coolmovies/view/pages/login/componentes/intro_page.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  List<Widget> _children = [];

  LoginViewModel(this.context);
  List<Widget> get children => _children;
  final BuildContext context;
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  @override
  Future<void> onModelReady() {
    _children = [
      GreetingsPage(
        toNextPage: () {
          _pageController.nextPage(
            duration: const Duration(microseconds: 500),
            curve: Curves.easeIn,
          );
        },
      ),
      const IntroPage()
    ];
    return super.onModelReady();
  }
}
