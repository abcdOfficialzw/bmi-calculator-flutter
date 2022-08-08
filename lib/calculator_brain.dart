import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.weight, @required this.height});
  final int height;
  final int weight;
  double _bmi;

  double calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  String getBMI() {
    double bmi = calculateBMI();
    return bmi.toStringAsFixed(1);
  }

  String getResults() {
    double bmi = calculateBMI();
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    double bmi = calculateBMI();
    if (bmi >= 25) {
      return 'You have a higher than normal body mass index. Try to exercise more. ';
    } else if (bmi > 18.5) {
      return 'You have a normal body mass index. Good job';
    } else {
      return 'You have a lower than normal body mass index. You can eat a bit more';
    }
  }
}
