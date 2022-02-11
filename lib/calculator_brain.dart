import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  // CalculatorBrain({@required this.height, @required this.weight});
  final int? height;
  final int? weight;
  double? _bmi;

  CalculatorBrain({this.height, this.weight}) {
    _bmi = weight! / pow((height! / 100), 2);
  }

  String calculateBMI() {
    return _bmi!.toStringAsFixed(1);
  }

  // String calculateBMI() {
  //   _bmi = weight! / (pow(height! / 100, 2));
  //   return _bmi!.toStringAsFixed(1);
  // }

  String lowerBMI() {
    _bmi = (18.5 - _bmi!) / ((18.5 + _bmi!) / 2) * 100;
    return _bmi!.toStringAsFixed(1);
  }

  String higherBMI() {
    _bmi = (_bmi! - 25) / ((25 + _bmi!) / 2) * 100;
    return _bmi!.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi! >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi! >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight. Try to excercise more to reduce your weight by ' +
          higherBMI() +
          "%";
    } else if (_bmi! >= 18.5) {
      return 'You have a normal body weight. Good job!.';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more by adding ' +
          lowerBMI() +
          "%" +
          ' weight';
    }
  }
}
