import 'package:flutter/cupertino.dart';

import 'dart:math';

class Calcbrain {
  final int height;
  final int weight;
  double bmi = 1000000000;
  Calcbrain({@required this.height, @required this.weight});

  String bmiresult() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String description() {
    if (bmi >= 25) {
      return "you have a higher normal body weight, try to exercise more .";
    } else if (bmi >= 18.5) {
      return " you have a normal body weight . Good job! ";
    } else {
      return "you have a lower than normal body weight . you should eat more !";
    }
  }

  String getResult() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal ";
    } else {
      return "Underweight";
    }
  }
}
