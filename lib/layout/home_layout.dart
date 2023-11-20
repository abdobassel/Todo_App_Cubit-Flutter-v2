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
        listener: (context, state) {
          if (state is AppInserteDatabase) {
            Navigator.pop(context);

            titleController.clear();
            timeController.clear();
            dateController.clear();
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text('${cubit.titles[cubit.currentIndex]}'),
              // backgroundColor: Color(0xff614A99),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isbootmSheetOpen) {
                  if (keyForm.currentState != null) {
                    if (keyForm.currentState!.validate()) {
                      cubit.insertDatabase(
                          time: timeController.text,
                          title: titleController.text,
                          date: dateController.text);
                      cubit.isbootmSheetOpen = true;
                      cubit.changeIconsheet();
                    }
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet((context) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          color: Colors.grey[250],
                          child: Form(
                            key: keyForm,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DefaultTextForm(
                                      controller: titleController,
                                      labeltext: 'Title المهمة ايه يابرنس؟',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return ' لا يا من كنت حبيبي متسبش العنوان فاضي كدة ';
                                        }
                                        return null;
                                      },
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
                                      labeltext: 'Time الوقت',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return ' لو سمحت في حاجه اسمها وقت التاسك مش بالبوج';
                                        }
                                        return null;
                                      },
                                      type: TextInputType.datetime,
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
                                                lastDate: DateTime.parse(
                                                    '2024-12-31'))
                                            .then((value) {
                                          dateController.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      labeltext: 'Date تاريخ',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return '  مش محتاج افكرك بقى يااخي تعبتني معاك';
                                        }
                                        return null;
                                      },
                                      type: TextInputType.datetime,
                                      prefix: Icons.calendar_month_rounded)
                                ]),
                          ),
                        );
                      })
                      .closed
                      .then((value) {
                        cubit.changeOpenCloseSheet(
                            isShow: false, icon: Icons.edit);
                      });
                  cubit.changeOpenCloseSheet(isShow: true, icon: Icons.add);
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
