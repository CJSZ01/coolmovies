import 'package:coolmovies/utils/lottie_animations.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class FilmLoadingWidget extends StatelessWidget {
  const FilmLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(LottieAnimations.film));
  }
}
