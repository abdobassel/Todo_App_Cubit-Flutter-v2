import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_v2/bloc_cubit/observer.dart';
import 'package:todo_app_v2/layout/home_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const Todo_v2());
}

class Todo_v2 extends StatelessWidget {
  const Todo_v2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
