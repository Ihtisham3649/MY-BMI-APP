import 'dart:math';

import 'main.dart';

class BmiBrain {

  BmiBrain({this.weight,this.height});

  final weight;
  final height;

   double _bmi = null ?? 0.0;

//checking the number of bmi
   String bmiCal(){
     _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }





  //printing statement according to the weight category
  String getStatement(){
    if(_bmi >25){
      return 'you have a higher than a normal body weight. Try to exercise more';
    }
    else if (_bmi >18.5){
      return 'you have a normal body weight. Good Job!';
    }
    else {
      return 'you have a lower than a normal body weight. Try to eat more';
    }
  }

  //checking weight category
  String getResult(){
    if(_bmi >25){
      return 'OverWeight';
    }
    else if (_bmi >18.5){
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }
}