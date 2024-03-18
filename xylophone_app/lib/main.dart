import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const Xylophone());  // Arrow Functions are used to save space and are used for only single lined functions.


class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  void playSound(int num){
    final player = AudioPlayer();  // Audio Player class is used to play audio
    player.play(AssetSource('note$num.wav'));  // It automatically searches for music in asset folder that is way we don't give full path
  }
  Expanded buildKey({required Color color, required int num}){   // For named parameters we use curly braces to declare them.
    return Expanded(
      child: FlatButton(
        color: color,   // We use color argument
        onPressed: (){       // Audio Cache class is depricated and now is not used
          playSound(num);
        }, child: Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildKey(color: Colors.red, num: 1),
              buildKey(color: Colors.orange, num: 2),
              buildKey(color: Colors.yellow, num: 3),
              buildKey(color: Colors.green, num: 4),
              buildKey(color: Colors.teal, num: 5),
              buildKey(color: Colors.blue, num: 6),
              buildKey(color: Colors.purple, num: 7),
            ],
            ),
          ),
        ),
    );
  }
}
