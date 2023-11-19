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
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
            .then((value) {
          print('crated table');
        });
        print('createed db');
        print(database);
      },
      onOpen: (database) {
        print('opened database');
        getDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

  void insertDatabase(
      {required String title,
      required String date,
      required String time}) async {
    return await database?.transaction((txn) async {
      try {
        txn
            .rawInsert(
                'INSERT INTO tasks (title,date,time,status) VALUES ("$title","$date","$time","new")')
            .then((value) {
          print(value);
          emit(AppInserteDatabase());
          getDatabase(database);
        });
        print('inserted database');
      } catch (error) {
        print('error is ${error.toString()}');
      }
    });
  }

  void getDatabase(database) {
    database.rawQuery('SELECT * FROM tasks').then((value) {
      print(value);
      emit(AppGetDatabase());
    });
  }
}
