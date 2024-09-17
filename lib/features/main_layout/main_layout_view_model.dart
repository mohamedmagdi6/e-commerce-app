import 'package:e_commerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:e_commerce_app/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab.dart';
import 'package:e_commerce_app/features/main_layout/main_layout_states.dart';
import 'package:e_commerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutViewModel extends Cubit<MainLayoutStates> {
  MainLayoutViewModel() : super(MainLayoutInitState());

  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  changeSelectedIndex(int selectedIndex) {
    emit(MainLayoutInitState());
    currentIndex = selectedIndex;
    emit(MainLayouChangeIndexState());
  }
}
