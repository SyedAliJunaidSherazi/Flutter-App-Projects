import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';

// class TasksScreen extends StatefulWidget {
//
//   @override
//   State<TasksScreen> createState() => _TasksScreenState();
// }

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // by using isScrolledControlled , the modal will take full screen
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(

                      //         (newTextValue) {
                      //   // setState(() {
                      //   //   list.add(Task(title: newTextValue));
                      //   // });
                      //   Navigator.pop(context);
                      // }
                      ),
                    ),
                  ));
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 50.0, bottom: 30.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 35,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Text(
                    // using method of Provider class that has been specified in the parent class which is App(),
                    // now we can listen to the data which is in this case , a list of Tasks ,

                    // using getter that we have declared in task data class to avoid repetition of code
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class TasksScreen extends StatelessWidget {
//   const TasksScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.lightBlueAccent ,
//         child: Icon(Icons.add , color: Colors.white,),
//         onPressed: () {
//           // by using isScrolledControlled , the modal will take full screen
//           showModalBottomSheet(context: context,  isScrollControlled: true,builder:(context) =>
//               SingleChildScrollView(
//                   child:Container(
//                     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//                     child: AddTaskScreen(),
//                   )
//               ));
//         },),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: 50.0 , bottom: 30.0 , left: 30.0 , right: 30.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//
//                     child: Icon(Icons.list , color: Colors.lightBlueAccent, size: 35,),
//                     backgroundColor: Colors.white,
//                     radius: 30.0,
//
//                   ),
//                   SizedBox(
//                     height: 12.0,
//                   ),
//                   Text(
//                     'Todoey',
//                     style: TextStyle(
//                       fontSize: 50,
//                       color: Colors.white
//                     ),
//
//                   ),
//                   Text(
//                     '12 Tasks',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15.0,
//                     ),
//                   )
//                 ],
//
//
//               ),
//
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topRight: Radius.circular(30.0)  , topLeft: Radius.circular(30.0))
//                 ),
//                 child: TaskList() ,
//
//               ),
//             ),
//           ],
//
//
//         ),
//
//       ),
//     );
//   }
// }
