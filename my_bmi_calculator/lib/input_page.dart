import 'dart:ffi';

import 'package:bmi_calculator/calculator/bmi_calculator_controller.dart';
import 'package:bmi_calculator/results/bmi_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bmi_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_constants.dart';
import 'footer_button.dart';
import 'gender.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 100;
  int weight = 10;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                    selectedGender == Gender.MALE
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    IconContent(FontAwesomeIcons.mars, Gender.MALE.name),
                    () {
                      setState(
                        () {
                          selectedGender = Gender.MALE;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BMICard(
                    selectedGender == Gender.FEMALE
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    IconContent(FontAwesomeIcons.venus, Gender.FEMALE.name),
                    () {
                      setState(
                        () {
                          selectedGender = Gender.FEMALE;
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                      kActiveCardColour,
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Height', style: kLabelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kBoldLabelTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0,
                                  ),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 30.0),
                                  inactiveTickMarkColor: Color(0xFF503049),
                                  activeTrackColor: Colors.white,
                                  overlayColor: Color(0xFFEB1555),
                                  thumbColor: Color(0xFFEB1555)),
                              child: Slider(
                                value: height.toDouble(),
                                min: 100.0,
                                max: 220.0,
                                onChanged: (double change) {
                                  setState(
                                    () {
                                      height = change.toInt();
                                    },
                                  );
                                  //height = change as int;
                                },
                              ),
                            )
                          ]),
                      null),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                      kActiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBoldLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundActionButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight -= 1;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundActionButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight += 1;
                                });
                              }),

                            ],
                          )
                        ],
                      ),
                      null),
                ),
                Expanded(
                  child: BMICard(kActiveCardColour, Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBoldLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundActionButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              age -= 1;
                            });
                          }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundActionButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              age += 1;
                            });
                          }),
                        ],
                      )
                    ],
                  ), null),
                )
              ],
            ),
          ),
          FooterButton('CALCULATE', () {
            CalculatorBrain calculatorBrain = CalculatorBrain(height, weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                BmiResultsPage(calculatorBrain.calculateBMI(), calculatorBrain.bmiReadableResult(), calculatorBrain.bmiInterpretation())));
          },)
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {

    final IconData iconData;
    final Function tapActionButton;
    RoundActionButton(this.iconData, this.tapActionButton);

    @override
    Widget build(BuildContext context) {
      return RawMaterialButton(
        child: Icon(iconData,),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: tapActionButton,
      );
    }
}
