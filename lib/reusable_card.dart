import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild, this.onPressed});
  final Color color;
  final Widget cardChild;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
