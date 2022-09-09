import 'package:flutter/material.dart';

import 'bmi_constants.dart';

class FooterButton extends StatelessWidget {

  final String label;
  final Function onTap;

  FooterButton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.pink,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: kFooterHeight,
        child: Center(
          child: Text(label,
            style: kLargeButtonTextStyle,),
        ),
      ),
    );
  }

}