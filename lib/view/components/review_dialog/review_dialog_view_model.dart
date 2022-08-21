import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ReviewDialogViewModel extends BaseViewModel {
  final Movie _movie;

  ReviewDialogViewModel(this._movie);
  Movie get movie => _movie;

  final TextEditingController _reviewTitleController = TextEditingController();
  TextEditingController get reviewTitleController => _reviewTitleController;
  final TextEditingController _reviewBodyController = TextEditingController();
  TextEditingController get reviewBodyController => _reviewBodyController;
  double reviewRating = 0;

  @override
  Future<void> onModelReady() {
    viewState = ViewState.SUCCESS;
    return super.onModelReady();
  }
}
