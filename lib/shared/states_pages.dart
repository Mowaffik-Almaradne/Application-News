abstract class NewsState {}

class NewsInitialsState extends NewsState {}

class NewsBottomNavigatorState extends NewsState {}

class NewsGetBusinessLodingState extends NewsState {}

class NewsGetBusineesSuccessState extends NewsState {}

class NewsGetBusineesErrorState extends NewsState {
  String error;
  NewsGetBusineesErrorState(this.error);
}

class NewsGetSportsLodingState extends NewsState {}

class NewsGetSportsSuccessState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {
  String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLodingState extends NewsState {}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  String error;
  NewsGetScienceErrorState(this.error);
}



class NewsGetSearchLodingState extends NewsState {}

class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  String error;
  NewsGetSearchErrorState(this.error);
}

