import 'package:flutter/cupertino.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task('Task 1', false),
    Task('Buy milk', false),
    Task('Buy bread', false),
    Task('Clean the house', false),
    Task('Hunt kids', true)
  ];

  void addNewItem(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

}