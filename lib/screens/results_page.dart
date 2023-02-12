import 'package:bmi_calculator/components/button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({
    @required this.bmiResult,
    @required this.interpretation,
    @required this.resultText,
});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,top:15.0,right: 15.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      'Your Result:',
                  style: kTitleStyle,
                  ),
                ),
              )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                backgroundColor: kbodyContainerColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text(
                         widget.interpretation.toUpperCase(),
                         style: kResultTextStyle,
                       ),
                      Text(
                        widget.bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        widget.resultText,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ) ),
              Button(
                  buttonText: 'RECALCULATE',
                  onTapped: (){
                    Navigator.pop(context);
                  },
              )
        ],
      ),
    );
  }
}
