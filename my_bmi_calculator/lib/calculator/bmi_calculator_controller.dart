import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;
  CalculatorBrain(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiReadableResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if(_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String bmiInterpretation() {
    if (_bmi >= 25) {
      return 'Please hit the gym if you want to live!';
    } else if(_bmi > 18.5) {
      return 'I guess you are fine';
    } else {
      return 'You need some meat on those bones';
    }
  }
}