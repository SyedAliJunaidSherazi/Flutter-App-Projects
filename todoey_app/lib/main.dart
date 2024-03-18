import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    // using Provider class ChangeNotifierProvider so that we can read data in all the child classes that the taskData is providing
    //in this case , it will be a list from task data class

    return ChangeNotifierProvider (

      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  TasksScreen(),
      ),
    );
  }
}
