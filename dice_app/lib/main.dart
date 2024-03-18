import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown.shade800,
        appBar: AppBar(
          title: Text("Dicee"),
          backgroundColor: Colors.brown.shade900,
        ),
        body: const DiceApp(),
      ),
    ),
  );
}
class DiceApp extends StatefulWidget {  // Stateful widget is used hwn we have widgets or variables that can change their state
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDiceNo = 1;
  int rightDiceNo = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(  // Expanded Widget is used to expand the child widget to take as much space as available on the screen
              child: FlatButton(
                onPressed: (){
                  setState(() {   // Set State function is used in stateful widget to change the state of variable or widget
                                 // It perform a hot reload by by applying changes. The change code is marked dirty first and then changed and hot reloaded.
                    leftDiceNo = Random().nextInt(6) +1;
                    rightDiceNo = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset(
                    'images/dice$leftDiceNo.png'   // Sets the specific no image as given in variable
                ),
              ) // Another way to add an asset image
          ),
          Expanded(
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    rightDiceNo = Random().nextInt(6) + 1;
                    leftDiceNo = Random().nextInt(6) +1;
                  });
                },
                child: Image.asset(
                    'images/dice$rightDiceNo.png'),
              )
          ),
        ],
      ),
    );
  }
}

/*
class DiceApp extends StatelessWidget {  //  We use stateless widget when the state of app doesn't change and all widgets are final
  const DiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(  // Expanded Widget is used to expand the child widget to take as much space as available on the screen
              child: FlatButton(
                onPressed: (){   // On pressed method is must for button to implement
                  print("Left Button");
                },
                child: Image.asset(    // In this case an image is used as a child of flat button
                    'images/dice1.png'),
              ) // Another way to add an asset image
              ),
          Expanded( // We can also control the area covered by ant one widget by using flex property
              //flex: 2,  // It will set this widget to take twice as much space as the other widget. By default it is always 1.
              child: FlatButton(
                onPressed: (){
                  print("Right Button");
                },
                child: Image.asset(
                    'images/dice2.png'),
              ) // Another way to add an asset image
              ),
        ],
      ),
    );
  }
}

 */
