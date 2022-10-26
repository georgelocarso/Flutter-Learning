import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  CalculatorBrain(this.weight, this.height);
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);

    print("_Weight : " + weight.toString());
    print("_Height : " + height.toString());
    print("_BMI " + _bmi.toString());
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Need to get your weight down! You can do it!";
    } else if (_bmi >= 18.5) {
      return "Congrats your BMI is normal, continue your healthy life style, or improve it!";
    } else {
      return "You are underweight, eat more if it is possible.";
    }
  }
}
