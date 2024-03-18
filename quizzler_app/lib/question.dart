class Question{
  String quesText = '';
  bool quesAns = true;

  // The curly braces means that these properties are required for the constructor.
  Question({required String ques, required bool ans}){   // There function is same as that of arguments
    quesText = ques;
    quesAns = ans;
  }
}