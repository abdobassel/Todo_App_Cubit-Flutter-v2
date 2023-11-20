import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/bloc_cubit/cubit.dart';
import 'package:todo_app_v2/bloc_cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppBaseStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
          itemCount: AppCubit.get(context).newTask.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 5.5, top: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xffDFB6B2),
                      child: Text(
                        AppCubit.get(context).newTask[index]['time'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            AppCubit.get(context).newTask[index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            AppCubit.get(context).newTask[index]['date'],
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_circle),
                      color: Color(0xffD5EBCB),
                      iconSize: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.archive),
                      color: Colors.black54,
                      iconSize: 30,
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
