import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/bloc_cubit/cubit.dart';
import 'package:todo_app_v2/bloc_cubit/states.dart';
import 'package:todo_app_v2/components/components.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppBaseStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archiveTask;
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ItemTaskBuilder(context,
                date: tasks[index]['date'],
                time: tasks[index]['time'],
                txt: tasks[index]['title'],
                id: tasks[index]['id'],
                status: tasks[index]['status']);
          },
        );
      },
    );
  }
}
