import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyBusinessCardWidget());
}

class MyBusinessCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/download.jpg'),
              ),
              Text(
                "Tsholofelo Pole",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'handwriting',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "THE EATER OF CAKE",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'sourceSans',
                    color: Colors.pink,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                width: 250,
                child: Divider(
                  color: Colors.teal.shade200,
                ),
              ),
              Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '+27 78 256 3698',
                        style: TextStyle(
                            color: Colors.teal.shade700,
                            fontFamily: 'sourceSans',
                            fontSize: 20.0),
                      ),
                    ),
                  )),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal.shade700,
                      ),
                      title: Text(
                        'abc@def.com',
                        style: TextStyle(
                          color: Colors.teal.shade700,
                          fontSize: 20.0,
                          fontFamily: 'sourceSans',
                        ),
                      ),
                    )),
              ),
              TextButton(
                child: Text('Login'),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.red,
              height: double.infinity,
              width: 100,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              height: double.infinity,
              width: 100,
            )
          ],
        ),
      ),
    ));
  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 200,
                  color: Colors.teal,
                  child: Text('First container ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                Container(
                  child: Text('Second container'),
                  width: 50,
                  height: 200,
                  color: Colors.pink,
                ),
                Container(
                    width: 50,
                    height: 200,
                    child: Text('Third container'),
                    color: Colors.deepPurple),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
