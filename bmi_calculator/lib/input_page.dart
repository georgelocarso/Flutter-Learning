import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';

const bottomContainerHeight = 80.0;
const Color bottomContainerColor = Color(0xFFEB1555);

const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;

  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }

  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('BMI CALCULATOR')),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // updateColor(Gender.male);

                          selectedGender = Gender.male;
                        });
                      },
                      child: ReuseableCard(
                        selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        IconContent(FontAwesomeIcons.mars, 'Male'),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReuseableCard(
                      selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      IconContent(FontAwesomeIcons.venus, 'Female'),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReuseableCard(activeCardColor, Container())),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReuseableCard(activeCardColor, Container())),
                  Expanded(child: ReuseableCard(activeCardColor, Container())),
                ],
              ),
            ),
            Container(
              height: bottomContainerHeight,
              width: double.infinity,
              color: bottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
            )
          ],
        ),
      ),
    );
  }
}

// https://appbrewery.com/courses/548873/lectures/9988849

