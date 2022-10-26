import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;

  int height = 140;
  int weight = 50;
  int age = 20;

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
                  Expanded(
                      child: ReuseableCard(
                    activeCardColor,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  print("minus");
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                                elevation: 0.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56.0,
                                  height: 56.0,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                              SizedBox(width: 20.0),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  print("plus");
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                elevation: 0.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56.0,
                                  height: 56.0,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: ReuseableCard(
                    activeCardColor,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  print("minus");
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                                elevation: 0.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56.0,
                                  height: 56.0,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                              SizedBox(width: 20.0),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  print("plus");
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                elevation: 0.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56.0,
                                  height: 56.0,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: (() {
                final calc = CalculatorBrain(weight, height);

                print("Weight : " + calc.weight.toString());
                print("Height : " + calc.height.toString());
                print("BMI : " + calc.calculateBMI());
                print("result : " + calc.getResult());
                print("Inter : " + calc.getInterpretation());

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(calc.calculateBMI(),
                          calc.getResult(), calc.getInterpretation()),
                    ));
              }),
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                height: bottomContainerHeight,
                width: double.infinity,
                color: bottomContainerColor,
                margin: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// https://appbrewery.com/courses/548873/lectures/9988849

