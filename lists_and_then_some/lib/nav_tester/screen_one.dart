import 'package:flutter/material.dart';
import 'package:lists_and_then_some/nav_tester/screen_teo.dart';
import 'global_state.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  late TextEditingController _name;
  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    _store.set('name', '');
    _name = TextEditingController();
    _name.text = _store.get('name');

  }
  
  void onPressed() {
    _store.set('name', _name.text);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenTwo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page one'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('first page in nav list'),
              ElevatedButton(onPressed: onPressed, child: Text('Next')),
              TextField(controller: _name,
              decoration: InputDecoration(labelText: 'Enter your name'),)
            ],
          ),
        ),
      ),
    );
  }
}
