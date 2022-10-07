import 'package:bmi_calculator/bmi_card.dart';
import 'package:bmi_calculator/bmi_constants.dart';
import 'package:flutter/material.dart';

import '../footer_button.dart';

class BmiResultsPage extends StatelessWidget {

  final String finalResult;
  final String resultText;
  final String interpretation;

  BmiResultsPage(this.finalResult, this.resultText, this.interpretation);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kBoldLabelTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BMICard(
                kActiveCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText, style: kBmiResultTextStyle),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                       finalResult,
                      style: kBmiResultValueTextStyle,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(interpretation),
                  ],
                ),
                null),
          ),
          FooterButton(
            'RE-CALCULATE',
            () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
