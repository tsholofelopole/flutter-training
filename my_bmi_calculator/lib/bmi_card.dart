import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {

  final Color cardColor;
  final Widget cardChild;
  Function listenToClicks;
  BMICard(this.cardColor, this.cardChild, this.listenToClicks);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: listenToClicks,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

}