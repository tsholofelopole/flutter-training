import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87, title: Text("I am poorgirl")
        ),
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Image(
            image: AssetImage('images/coal.png'),
          ),
        ),
      ),

    ),
  );
}
