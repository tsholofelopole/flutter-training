import 'package:flutter/material.dart';
import 'package:lists_and_then_some/widgets/authenticator.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({Key? key}) : super(key: key);

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  late bool _isAauthenticated;
  void _onauthenticate(bool value) {
    setState(() {
      _isAauthenticated = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _isAauthenticated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ParentScreen'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[Athenticator(onauthenticated: _onauthenticate,),
          Text('Authenticate: $_isAauthenticated')],
        ),
      ),
    );
  }
}
