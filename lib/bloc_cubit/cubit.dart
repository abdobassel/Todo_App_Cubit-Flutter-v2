import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/bloc_cubit/states.dart';
import 'package:todo_app_v2/todo_screens/archived.dart';
import 'package:todo_app_v2/todo_screens/done_tasks.dart';
import 'package:todo_app_v2/todo_screens/new_tasks.dart';
import 'package:sqflite/sqflite.dart';

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

  Database? database;
  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database database, int version) async {
        // When creating the db, create the table
        await database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT)')
            .then((value) {
          print('crated table');
        });
        print('createed db');
        print(database);
      },
      onOpen: (database) {
        print('opened database');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }
}
