import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  return runApp(
    MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioCache();

  Expanded createExpandedButton(int sound, Color color) {
    return Expanded(
      child: TextButton(
        style: createdPadding(color),
        onPressed: () {
          play(sound);
        },
      ),
    );
  }

  ButtonStyle createdPadding(Color color) {
    return ButtonStyle(
      padding: MaterialStateProperty.all(
        EdgeInsets.all(25.0),
      ),
      backgroundColor: MaterialStateProperty.all(color),
    );
  }

  void play(int soundToPlay) {
    player.play('note$soundToPlay.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            createExpandedButton(1, Colors.red),
            createExpandedButton(2, Colors.deepOrange),
            createExpandedButton(3, Colors.green),
            createExpandedButton(4, Colors.purple),
            createExpandedButton(5, Colors.pink),
            createExpandedButton(6, Colors.indigo),
            createExpandedButton(7, Colors.teal),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
