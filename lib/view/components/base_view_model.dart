import 'package:coolmovies/core/view_state_enum.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel extends ChangeNotifier {
  ViewState viewState = ViewState.LOADING;

  Future<void> onModelReady() async {}
  Future<void> onDispose() async {}
}
