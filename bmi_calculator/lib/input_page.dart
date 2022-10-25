import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;

  int height = 140;
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Expanded(
                      child: ReuseableCard(
                    activeCardColor,
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              '  cm',
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8d8e98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x30EB1555),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            min: 120.0,
                            max: 250.0,
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    )),
                  )),
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

