import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';

class TaskList extends StatefulWidget {
  List<Task> tasks;
  TaskList({required this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // instead of intiate a new variabel, optional way is we could access all the statefulwidget parameter using "widget" as you did in innit
  List<Task> tasks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = widget.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTile: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkboxCallback: (valueL) {
              // print("$valueL HWAT INSIDE IT THO?");
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}
