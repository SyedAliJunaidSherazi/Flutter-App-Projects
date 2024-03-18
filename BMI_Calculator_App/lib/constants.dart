import 'package:flutter/material.dart';
/*
Constants in dart can be placed in separate files so that can be used at other places.
Most of the time we use the same set of code for styling of different elements or other things so it is better to extract that pieceof code.
And make it a constant so that we can use it where ever we want to. Also a constant name starts with "k" word.
By writing k we can access all the constants created by us and by the flutter team as well.
 */

const int kCardColor = 0xFF1A1E33;   // Constant value is checked at the compile time and cannot be changed at runtime. Final is similar to constant but can be decalred at runtime.
const kInactiveColor = 0xFF111328;

const kLabelTextStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98)
);

const kValueStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w900
);

const kLargeButtonStyle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold
);

const kTitleTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold
);

const kResultStyle = TextStyle(
    color: Color(0xFF24D876),
    fontSize: 22.0,
    fontWeight: FontWeight.bold
);

const kWeightTextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold
);