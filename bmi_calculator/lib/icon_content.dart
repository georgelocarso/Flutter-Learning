import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent(this.genderIcon, this.genderText);

  final IconData genderIcon;
  final String genderText;

  static const labelTextStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
