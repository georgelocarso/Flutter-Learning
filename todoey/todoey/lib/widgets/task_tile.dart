import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String taskTile;
  final void Function(bool?)? checkboxCallback;
  
  TaskTile({this.taskTile = "", this.isChecked,required  this.checkboxCallback,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(
          taskTile,
          style: TextStyle(
              decoration: isChecked! ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlue,
          value: isChecked,
          onChanged: checkboxCallback,
          // SOME HOW YA, IF YOU HAVE RETURN ON THE CALLBACK PRAMETERS, IT IS THE CHECKBOX VALUES.
        ));
  }
}




 // setState(() {
          //   print("isChecked_beofre: $isChecked");
          //   isChecked = checkBoxState;
          //   print("checkBoxState: $checkBoxState");
          //   print("isChecked_2: $isChecked");
          //   print('====');
          // });