import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {


  TimeDisplay(this.duration, this.color, this.onClear);
  Duration duration = Duration();
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;

  void _onClicked() {
    onClear(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(5),
        child: Text(duration.toString(), style: TextStyle(fontSize: 20, color: Colors.red),),),
        IconButton(icon: Icon(Icons.clear), onPressed: () { _onClicked(); },)

      ],
    );
  }

}
