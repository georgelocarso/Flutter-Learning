import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard(this.cardColor, this.childWidget);

  final Color cardColor;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
