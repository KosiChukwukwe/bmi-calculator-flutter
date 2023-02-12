import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({
    this.weight,
    this.height,
});

  final int height;
  final int weight;

  double _BMI;

  String calcBMI(){
    _BMI = weight/ pow(height/100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult(){
    if (_BMI >= 25){
      return 'OverWeight';
    } else if (_BMI > 18.5) {
      return 'Normal';
    } else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if (_BMI >= 25){
      return 'You have a higher than normal body mass index, try to exercise more.';
    } else if (_BMI > 18.5) {
      return 'You have a normal body mass index, Well done!.';
    } else{
      return 'You have a lower than normal body weight, You can eat a bit more';
    }
  }
}