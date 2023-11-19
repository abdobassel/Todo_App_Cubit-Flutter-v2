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
      create: (context) => AppCubit(AppInitState()),
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
              onPressed: () {},
              child: Icon(Icons.edit),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomSheetindex(index);
              },
              currentIndex: cubit.currentIndex,
              iconSize: 30,
              selectedFontSize: 30,
              unselectedFontSize: 30,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: Icon(Icons.task),
                      onPressed: () {},
                    ),
                    label: 'NewTask'),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: Icon(Icons.done),
                      onPressed: () {},
                    ),
                    label: 'Done'),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: Icon(Icons.archive_rounded),
                      onPressed: () {},
                    ),
                    label: 'Archived'),
              ],
            ),
          );
        },
      ),
    );
  }
}
