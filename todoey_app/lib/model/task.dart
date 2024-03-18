
class Task{
  late String title;
  late bool isDone;

  Task({required this.title , this.isDone = false});

  void toggleChange(){
    isDone   = !isDone;
  }


}