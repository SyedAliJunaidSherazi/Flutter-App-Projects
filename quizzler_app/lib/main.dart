import 'package:flutter/material.dart';
import 'package:quizzler/question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizApp(),
          ),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  List<Icon> score = [];   // Lists are equivalent to Arrays and function in the same way. We have to give Datatype of list or can let it be dynamic.

  /*  We have done this part using class method.

  List<String> question = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answers =[false, true, true];
 */

  QuestionBank questionBank = QuestionBank();

  void correctAns(bool userAns){
    bool correctAnswer = questionBank.getAns();
    if(questionBank.isFinished()){
      Alert(
          context: context,
          title: "End of Questions"
      ).show();
      questionBank.resetQuestNo();
      score.clear();
    }
    else {
      if(userAns == correctAnswer){
        score.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ));
      }
      else{
        score.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  //ques[questionNo].quesText,  // we can target each field of the class
                  questionBank.getText(),  // Gets the text value as The above written field cannot be targeted as it is private.
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: FlatButton(
                onPressed: (){
                  // bool correctAns = ques[questionNo].quesAns;  Cannot be targeted as list is decalred private.
                  setState(() {
                    correctAns(true);
                    questionBank.nextQues();
                  });
                },
                color: Colors.green.shade900,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: FlatButton(
                onPressed: (){
                  // bool correctAns = ques[questionNo].quesAns;
                  setState(() {
                    correctAns(false);
                    questionBank.nextQues();
                  });
                },
                color: Colors.red.shade900,
                child: Text(
                  'False',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0
                  ),
                ),
              ),
            )
        ),
        Row(
          children: score,       // Rows and Columns add children in form of list of Widgets so can give them a list that contain widgets.
        )
      ],
    );
  }
}

