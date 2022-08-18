import 'package:coolmovies/view/components/base_view.dart';
import 'package:coolmovies/view/pages/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => BaseView(child: Column()),
    );
  }
}
