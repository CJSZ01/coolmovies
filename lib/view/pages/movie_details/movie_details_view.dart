import 'package:coolmovies/view/pages/movie_details/movie_details_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsViewModel>.reactive(
      viewModelBuilder: () => MovieDetailsViewModel(),
      builder: (context, model, child) {
        return SizedBox();
      },
    );
  }
}
