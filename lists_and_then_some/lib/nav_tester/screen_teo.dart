import 'package:flutter/material.dart';
import 'package:lists_and_then_some/nav_tester/screen_one.dart';

import 'global_state.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  GlobalState _store = GlobalState.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('first page in nav list'),
                ElevatedButton(onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenOne()));
                  }
                }, child: Text('Next')),
                Text('Welcome: ${_store.get('name')}')
              ],
            ),
          ),
      ),
    );
  }
}
