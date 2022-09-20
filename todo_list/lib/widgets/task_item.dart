import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  final String task;
  final bool taskStatus;
  Function(bool?) updateTask;

  TaskItemWidget(this.task, this.taskStatus, this.updateTask);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        style: TextStyle(
            decoration: taskStatus ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: taskStatus,
        onChanged: updateTask,
      ),
    );
  }
}
