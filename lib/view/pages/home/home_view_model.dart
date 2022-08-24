import 'package:coolmovies/core/repositories/interfaces/movie_repository_interface.dart';
import 'package:coolmovies/view/components/base_view_model.dart';
import 'package:coolmovies/view/pages/catalog/catalog_view.dart';
import 'package:coolmovies/view/pages/profile/profile_view.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final IMovieRepository _repository;

  late final List<Widget> _children;
  List<Widget> get children => _children;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  @override
  Future<void> onModelReady() async {
    _children = [CatalogView(repository: _repository), const ProfileView()];
  }

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  HomeViewModel(this._repository);
}
