import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../tabs/favorites_tab.dart';
import '../tabs/hometab/home_tab.dart';
import '../tabs/product_tab/products_tab.dart';
import '../tabs/user_tab/user_tab.dart';
import 'home_screen_states.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeInitialState());

  //todo: hold data
  //todo : handle logic
  int currentindex = 0;
  List<Widget> bodyList = [HomeTab(), ProductsTab(), FavoritesTab(), UserTab()];

  void bottomNavOnTab(int index) {
    currentindex = index;
    emit(ChangeSelectedIndexState());
  }
}
