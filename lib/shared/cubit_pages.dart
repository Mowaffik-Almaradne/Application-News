// ignore_for_file: unnecessary_import, unnecessary_string_interpolations

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/modules/business_page.dart';
import 'package:news_application/modules/science_page.dart';
import 'package:news_application/modules/sport_page.dart';
import 'package:news_application/shared/states_pages.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sport',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screen = [
    const BusinessPage(),
    const SportPage(),
    const SciencePage(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getDataBusiness();
    } else if (index == 1) {
      getDataSports();
    } else {
      getDatascience();
    }

    emit(NewsBottomNavigatorState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getDataBusiness() async {
    try {
      emit(NewsGetBusinessLodingState());
      final response = await DioHelper.getData(
        url: 'v2/everything',
        query: {
          // 'country': 'eg',
          // 'category': 'business',
          'q': 'tesla',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      );
      business = response.data['articles'];
      // print(business[0]['title']);
      // print(business.length);
      emit(NewsGetBusineesSuccessState());
    } catch (error) {
      // print(error.toString());
      emit(NewsGetBusineesErrorState(error.toString()));
    }
  }

  void getDataSports() async {
    try {
      emit(NewsGetSportsLodingState());
      final response = await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          // 'country': 'eg',
          // 'category': 'sports',
          'q': 'tesla',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      );
      sports = response.data['articles'];
      // print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    } catch (error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    }
  }

  void getDatascience() async {
    try {
      emit(NewsGetScienceLodingState());
      final response = await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          // 'country': 'eg',
          // 'category': 'science',
          'q': 'tesla',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      );
      science = response.data['articles'];
      // print(sports[0]['title']);
      emit(NewsGetScienceSuccessState());
    } catch (error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    }
  }

  void getSearch(String value) async {
    try {
      emit(NewsGetSearchLodingState());
      final response = await DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      );
      search = response.data['articles'];
      // print(sports[0]['title']);
      emit(NewsGetSearchSuccessState());
    } catch (error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    }
  }
}
