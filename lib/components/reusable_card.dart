import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.backgroundColor,
    this.methodOnTap,
    this.cardChild,
  });

  final Function methodOnTap;
  final Color backgroundColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: methodOnTap,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: cardChild,
      ),
    );
  }
}
