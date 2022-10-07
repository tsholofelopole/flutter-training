import 'package:flutter/material.dart';

class Athenticator extends StatefulWidget {
  final ValueChanged<bool> onauthenticated;

  const Athenticator({Key? key, required this.onauthenticated}) : super(key: key);

  @override
  State<Athenticator> createState() => _AthenticatorState(onauthenticated);
}

class _AthenticatorState extends State<Athenticator> {

  TextEditingController? _user;
  TextEditingController? _password;

  final ValueChanged<bool> onauthenticated;

  _AthenticatorState(this.onauthenticated);

  void _onClick() {
    if (_user?.text != 'user' || _password?.text != '1234') {
      onauthenticated(false);
    } else {
      onauthenticated(true);
    }
  }

  @override
  void initState() {
    super.initState();
    _password = TextEditingController();
    _user = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _user,
              decoration: InputDecoration(labelText: 'username'),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: 'password'),
              obscureText: true,
            ),
            Padding(padding: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('Authenticate'),
              onPressed: _onClick,
            ),)
          ],
        ),
      ),
    );
  }
}
