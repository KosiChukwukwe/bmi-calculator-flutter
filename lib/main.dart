import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
              color: Color(0xFF0A0E21)
          ),
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
      // initialRoute: '/first',
      // routes:{
      //   '/first': (context) => InputPage(),
      //   '/second': (context) => ResultsPage(),
      // }

    );
  }
}


