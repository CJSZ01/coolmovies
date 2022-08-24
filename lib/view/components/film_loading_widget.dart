import 'package:coolmovies/utils/lottie_animations.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class FilmLoadingWidget extends StatelessWidget {
  const FilmLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(LottieAnimations.film));
  }
}
