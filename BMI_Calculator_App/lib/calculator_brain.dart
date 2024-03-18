import 'dart:math';


class CalculatorBrain {

  CalculatorBrain({required this.bmiHeight , required this.bmiWeight});

  final int bmiHeight;
  final int bmiWeight;

  double _bmi=0;


  String getbmi(){

    _bmi =  bmiWeight/ pow(bmiHeight/100, 2);

    return _bmi.toStringAsFixed(1);
  }
  String returnResult(){

    String result;

    if(_bmi>=25){

       result="OverWeight";

    }else if( _bmi >18.5){
      result="Normal";

    }
    else{
      result="UnderWeight";
    }
    return result;


  }
  String returnInterpretation(){
    String interp;

    if(_bmi>=25){

      interp="You have a higher than Normal Body Weight. You should exercise more";

    }else if( _bmi >18.5){
      interp="You have Normal Body Weight. Good Job!";

    }
    else{
      interp="You have a lower than Normal Body Weight. You should eat more";

    }
    return interp;

  }



}