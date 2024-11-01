import 'dart:math';

import 'package:bmiapp/enums/classification.dart';

abstract class Bmi {
  static BmiClassification classification(double weight, double height) {
    final bmi = weight / pow(height, 2);
    if (bmi < 16) {
      return BmiClassification.severeThinness;
    } else if (bmi < 17) {
      return BmiClassification.moderateThinness;
    } else if (bmi < 18.5) {
      return BmiClassification.mildThinness;
    } else if (bmi < 25) {
      return BmiClassification.healthy;
    } else if (bmi < 30) {
      return BmiClassification.overweight;
    } else if (bmi < 35) {
      return BmiClassification.obesityClass1;
    } else if (bmi < 40) {
      return BmiClassification.obesityClass2;
    } else {
      return BmiClassification.obesityClass3;
    }
  }
}
