import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
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
                      'dbdbdb',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'DDDDDDDDd',
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
      },
    );
  }
}
