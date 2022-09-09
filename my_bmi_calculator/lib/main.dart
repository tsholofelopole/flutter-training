import 'package:bmi_calculator/results/bmi_results.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  ThemeData createAppTheme() {
    return ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0F0F1E)
        ),
        primaryColor: Color(0xFF0F0F1E),
        scaffoldBackgroundColor: Color(0xFF0F0F1E),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: createAppTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        ///result' : (context) => BmiResultsPage()
      },
    );
  }
}

