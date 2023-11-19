import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/bloc_cubit/states.dart';
import 'package:todo_app_v2/todo_screens/archived.dart';
import 'package:todo_app_v2/todo_screens/done_tasks.dart';
import 'package:todo_app_v2/todo_screens/new_tasks.dart';

class AppCubit extends Cubit<AppBaseStates> {
  AppCubit(super.initialState);
  static AppCubit get(context) => BlocProvider.of(context);
// logic app all start
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = ["New Tasks", "Done Tasks", "Archived Tasks"];

  void changeBottomSheetindex(int index) {
    currentIndex = index;
    emit(AppChangeBottomSheet());
  }
}
