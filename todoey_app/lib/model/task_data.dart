import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:collection/collection.dart';

//Since material package already contains foundation class  , we can simply import it
// as we have to provide the list to other widgets , we have to extend it from ChangeNotifier so that everytime
// a change occurs in the list , all other classes gets notified and rebuild themselves

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [
    Task(title: 'Eat Milk'),
    Task(title: 'Eat Mango'),
    Task(title: 'Eat Milk'),
  ];

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);



  void addTask (taskTitle){
    final task = Task(title: taskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleChange();
    notifyListeners();

  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}