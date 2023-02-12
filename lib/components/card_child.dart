import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CardChild extends StatelessWidget {
  const CardChild({
    @required this.cardIcon,
    @required this.cardText,
  });

  final IconData cardIcon;
  final String cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        const SizedBox(height: 15),
        Text(
          cardText,
          style: kcardTextStyle,
        )
      ],
    );
  }
}