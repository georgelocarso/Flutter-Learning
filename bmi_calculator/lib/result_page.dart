import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import "package:flutter/material.dart";

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(this.bmiResult, this.resultText, this.interpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text("BMI CALCULATOR"),
      )),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Text(
                  "YOUR RESULT",
                  style: kTitleTextStyle,
                ),
              )),
          Expanded(
            child: ReuseableCard(
                activeCardColor,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              height: bottomContainerHeight,
              width: double.infinity,
              color: bottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
