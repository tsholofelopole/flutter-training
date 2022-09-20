import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String? taskName;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              enabled: true,
              onChanged: (value) {
                taskName = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                  Provider.of<TaskData>(context).addNewItem(Task(taskName!, false));
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
          ],
        ),
      ),
    );
  }
}
