import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_v2/bloc_cubit/cubit.dart';
import 'package:todo_app_v2/bloc_cubit/states.dart';
import 'package:todo_app_v2/components/components.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var keyForm = GlobalKey<FormState>();

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
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.0),
                      child: Form(
                        key: keyForm,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          DefaultTextForm(
                              controller: titleController,
                              labeltext: 'Title',
                              validate: (value) {},
                              type: TextInputType.text,
                              prefix: Icons.title),
                          SizedBox(
                            height: 20.0,
                          ),
                          DefaultTextForm(
                              controller: timeController,
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  timeController.text =
                                      value!.format(context).toString();
                                });
                              },
                              labeltext: 'Time',
                              validate: (value) {},
                              type: TextInputType.text,
                              prefix: Icons.access_time_filled),
                          SizedBox(
                            height: 20.0,
                          ),
                          DefaultTextForm(
                              controller: dateController,
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2024-12-31'))
                                    .then((value) {
                                  dateController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              labeltext: 'Date',
                              validate: (value) {},
                              type: TextInputType.text,
                              prefix: Icons.calendar_month_rounded)
                        ]),
                      ),
                    );
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
