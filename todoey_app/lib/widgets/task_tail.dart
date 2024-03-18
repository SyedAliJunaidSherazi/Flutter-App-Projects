import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';

class TaskTail extends StatelessWidget {
  final title;
  final isChecked;
  final checkboxCallBack;
  final longPressCallBack;

  TaskTail({this.title, this.isChecked, this.checkboxCallBack , this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
    );
  }
}

// we have used stateful widget in parent widget cz we have to change the state of both child widget that is the Text() and CheckBox().
//iN Order to use same value for both widgets  , we have used stateful. the state class in stateful widget basically changes and makes a new replica on particular widget with the desired changes..
// While stateless widgets don't change their state or if they have to , then we have to destroy the current one and have to make a new widget from scratch.
// that why things are mostly declared as final inside stateless widgets.

// class TaskTail extends StatefulWidget {
//   @override
//   State<TaskTail> createState() => _TaskTailState();
// }
//
// class _TaskTailState extends State<TaskTail> {
//   late bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         'This is a task',
//         style: TextStyle(
//           decoration: isChecked ? TextDecoration.lineThrough : null,
//         ),
//       ),
//       trailing: TaskCheckBox(
//         checkBoxState: isChecked,
//         checkBoxOnChange:
//         },
//       ),
//     );
//   }
// }
//
// class TaskCheckBox extends StatelessWidget {
//   final checkBoxState;
//   final checkBoxOnChange;
//
//   TaskCheckBox({this.checkBoxState,this.checkBoxOnChange});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         activeColor: Colors.lightBlueAccent,
//         value: checkBoxState,
//         onChanged: checkBoxOnChange);
//   }
// }

// (newStateValue) {
// setState(() {
// isChecked = newStateValue;
// });
