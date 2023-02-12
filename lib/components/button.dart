import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    @required this.buttonText,
    @required this.onTapped
});
final Function onTapped;
final String  buttonText;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapped,
      child: Container(
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
        child: Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 16),
          child: Text(widget.buttonText,
            style: kcardButtonStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
