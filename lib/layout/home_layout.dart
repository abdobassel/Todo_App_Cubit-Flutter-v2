import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/bloc_cubit/cubit.dart';
import 'package:todo_app_v2/bloc_cubit/states.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(AppInitState())..createDatabase(),
      child: BlocConsumer<AppCubit, AppBaseStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text('${cubit.titles[cubit.currentIndex]}'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.insertDatabase(time: '5', title: 'llll', date: '2222');
                if (cubit.isbootmSheetOpen) {
                  Navigator.pop(context);
                  cubit.isbootmSheetOpen = false;
                  cubit.changeIconsheet();
                } else {
                  scaffoldKey.currentState?.showBottomSheet((context) {
                    return Text('data');
                  });
                  cubit.isbootmSheetOpen = true;
                  cubit.changeIconsheet();
                }
              },
              child: Icon(cubit.fabicon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomSheetindex(index);
              },
              currentIndex: cubit.currentIndex,
              iconSize: 30,
              selectedFontSize: 25,
              unselectedFontSize: 28,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.task_outlined), label: 'NewTasks'),
                BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_rounded), label: 'Archived'),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
