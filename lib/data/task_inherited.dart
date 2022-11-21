
import 'package:flutter/material.dart';
import 'package:projeto_a3_ironcar/components/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Lewis Hamilton', 'assets/images/lamborghini-centenario.webp', 3),
    Task('Charles Leclerc', 'assets/images/ferrari-f8.webp', 2),
    Task('Daniel Ricciardo', 'assets/images/BMW I8.png', 1),
  ];

  void newTask(String name, String photo, int insurance){
    taskList.add(Task(name, photo, insurance));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
