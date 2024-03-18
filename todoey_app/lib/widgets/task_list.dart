import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tail.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';
import 'package:todoey_flutter/model/task_data.dart';


import '../model/task.dart';

// class TaskList extends StatefulWidget {
//
//
//   @override
//   State<TaskList> createState() => _TaskListState();
// }

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return  ListView.builder(
          itemBuilder: (context, index) {

            final task = taskData.tasks[index];
            return TaskTail(


              // using method of Provider class that has been specified in the parent class which is App(),
              // now we can listen to the data which is in this case , a list of Tasks ,

              title: task.title,
              isChecked: task.isDone,
              longPressCallBack: (){
                taskData.deleteTask(task);
              },
              checkboxCallBack: (checkBoxState) {
                taskData.updateTask(task);

                //OR
                //We can use this approach by using method from Task class
                // setState(
                //   () {
                //     Provider.of<TaskData>(context).tasks[index].toggleChange();
                //   },
                // );

                // Or we can use General approach. in that case  , there is no neec to wrape Consumer Widget around Builder

                // // using method of Provider class that has been specified in the parent class which is App(),
                // // now we can listen to the data which is in this case , a list of Tasks ,
                //
                // title: Provider.of<TaskData>(context).tasks[index].title,
                // isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
                // checkboxCallBack: (checkBoxState) {
                // // setState(
                // //   () {
                // //     Provider.of<TaskData>(context).tasks[index].toggleChange();
                // //   },
                // // );
              },
            );
          },
          // using getter that we have declared in task data class to avoid repetition of code
          itemCount: taskData.taskCount,
        );

      },

    );
  }
}
