import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/resuable_widget.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi , required this.result , required this.interpretation});

  final String bmi;
  final String result;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,   // Allignment property is used to allign widgets wherever we want to. We can use it by using container widget
              child: Text(
                "Your Results",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableWidget(
                color: Color(0xFF1A1E33),
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(result.toUpperCase(), style: kResultStyle),
                    Text(
                      bmi,
                      style: kWeightTextStyle,
                    ),
                    Text(
                      interpretation,
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
          ),
          BottomButton(
              value: "RE-CALCULATE",
              onTap: (){
                Navigator.pop(context);   // Pops the current screen and moves back to old one
              }
          )
        ],
      ),
    );
  }
}
