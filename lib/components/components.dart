import 'package:flutter/material.dart';
import 'package:todo_app_v2/bloc_cubit/cubit.dart';

Widget ItemTaskBuilder(
  context, {
  required String txt,
  required String date,
  required String time,
  required int id,
  required String status,
}) =>
    Dismissible(
      key: Key('$id'),
      onDismissed: (direction) {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Text(
              '',
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
                  '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$date',
                  style: TextStyle(color: Colors.grey[300], fontSize: 18),
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
            color: Colors.green,
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
    );
