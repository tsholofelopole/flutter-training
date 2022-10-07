import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String _value = 'Time here';
  late Timer _timer;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);
    setState(() {
      _value = formatted;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Text(_value, style: TextStyle(fontSize: 20, ),);
  }
}
