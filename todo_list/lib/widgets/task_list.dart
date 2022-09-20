import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskItemWidget(
              taskData.tasks[index].name, taskData.tasks[index].isDone,
              (checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
          });
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}
