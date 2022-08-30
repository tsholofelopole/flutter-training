import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home:  MyHomePage()
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var ballNumber = 2;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('The ball of magic'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              ballNumber = Random().nextInt(5)+1;
            });
          },
          child: Image.asset(
              'images/ball$ballNumber.png'
          ),
        )
      ),
    );
  }
}
