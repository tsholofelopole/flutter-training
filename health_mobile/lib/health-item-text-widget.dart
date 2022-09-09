
import 'package:flutter/cupertino.dart';

const discoveryBlue = Color(0xFF003979);
class HealthItemTextWidget extends StatelessWidget {

  String text;

  HealthItemTextWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:  Color(0xFF151A21) ,
        fontSize: 20.0,
        fontFamily: 'sourceSans',
      ),
    );
  }
}