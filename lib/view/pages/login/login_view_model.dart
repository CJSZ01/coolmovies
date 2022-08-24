import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:coolmovies/view/components/film_loading_widget.dart';
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
  Future<void> onModelReady() async {
    _children = [
      const FilmLoadingWidget(),
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
    await Future.delayed(const Duration(seconds: 5));
    await _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    return super.onModelReady();
  }
}
