import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/card_child.dart';
import '../constants.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      methodOnTap: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      backgroundColor: selectedGender == Gender.male ?kbodyContainerColor:kinactiveBodyContainerColor,
                      cardChild: CardChild(
                        cardIcon: FontAwesomeIcons.mars,
                        cardText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      methodOnTap: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      backgroundColor: selectedGender == Gender.female ? kbodyContainerColor : kinactiveBodyContainerColor,
                      cardChild: CardChild(
                        cardIcon: FontAwesomeIcons.venus,
                        cardText: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: ReusableCard(
                backgroundColor: kbodyContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                    style: kcardTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                      style: kcardSubtitleTextStyle,
                      ),
                      Text('cm',
                      style: kcardTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(
                      context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30
                      )
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusableCard(
                      backgroundColor: kbodyContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kcardTextStyle,
                        ),
                        Text(weight.toString(),
                          style: kcardSubtitleTextStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )

                      ],
                    ),
                  )),
                  Expanded(child: ReusableCard(
                    backgroundColor: kbodyContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kcardTextStyle,
                        ),
                        Text(age.toString(),
                          style: kcardSubtitleTextStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )

                      ],
                    ),
                  )),
                ],
              ),
            ),
            Button(
                buttonText: 'CALCULATE',
                onTapped: (){
                  CalculatorBrain calc = CalculatorBrain(
                    height: height,
                    weight: weight
                  );
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calc.calcBMI(),
                      interpretation: calc.getResult(),
                      resultText: calc.getInterpretation())
                  ));
                })
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({@required this.onPress,@required this.icon});

  final IconData icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
    shape: CircleBorder(),
    fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50
      ),
      elevation: 0,
      child: Icon(
        icon
      ) ,
    );
  }
}

