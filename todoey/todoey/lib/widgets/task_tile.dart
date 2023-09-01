import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "task1 YOLO BMW 320i",
        style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
        isChecked!,
        (bool? checkBoxState) {
          setState(
            () {
              print("isChecked_beofre: $isChecked");
              isChecked = checkBoxState;
              print("checkBoxState: $checkBoxState");
              print("isChecked_2: $isChecked");
              print('====');
            },
          );
        },
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final Function(bool?)? toggleCheckboxState;

  TaskCheckBox(this.checkBoxState, this.toggleCheckboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.lightBlue,
        value: checkBoxState,
        onChanged: toggleCheckboxState);
  }
}
