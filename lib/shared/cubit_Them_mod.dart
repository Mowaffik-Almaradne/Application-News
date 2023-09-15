// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/states_Them_mod.dart';

import '../network/local/cach_helper.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialsState());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode({bool? fromState}) {
    if (fromState != null) {
      isDark = fromState;
      emit(ChangeModeMainStateMain());
    } else {
      isDark = !isDark;
      CachHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeMainStateMain());
      });
    }
  }
}
