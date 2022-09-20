import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';import '../custom_widgets/rounded_button.dart';

import 'registration_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenId = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    animation = ColorTween(begin: Colors.lightBlueAccent, end: Colors.white).animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      setState(() {

      });

    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Flash chat',
                      textStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                        speed: const Duration(milliseconds: 2000)
                    )
                  ],
                  //'Flash Chat',
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(Colors.lightBlueAccent,'Log In', () {
              Navigator.pushNamed(context, LoginScreen.screenId);
            }),
            RoundedButton(Colors.blueAccent,  'Register', () {
              Navigator.pushNamed(context, RegistrationScreen.screenId);
            }),
          ],
        ),
      ),
    );
  }
}

