import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final void Function() onTap;
  final String value;

  BottomButton({required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: Color(0xFFEB1555),
          width: double.infinity,    // Provides complete width of entire screen
          height: 80.0,
          margin: EdgeInsets.only(top: 10.0),
          child: Center(
            child: Text(
              value,
              style: kLargeButtonStyle,
            ),
          )
      ),
    );
  }
}