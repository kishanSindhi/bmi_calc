import 'dart:math';

class BMIBrain {
  BMIBrain({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You are overweighed and you should do more and more exercise';
    } else if (_bmi > 18) {
      return 'You are perfectly fit and your BMI is normal. Good job!';
    } else {
      return 'Eat a little bit more because you are under-weighted.';
    }
  }
}
