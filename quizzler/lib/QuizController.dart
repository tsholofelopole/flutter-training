
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Question.dart';

class QuizController {
  int _position = 0;
  List<Question> _questionList = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true)
  ];

  List<Question> get questionList => _questionList;

  List<Widget> scoreKeeper = [];

  String getQuestionText() {
    return _questionList[_position].question;
  }

  bool getQuestionAnswer() {
    return _questionList[_position].questionAnswer;
  }

  int updateIndex(context) {
    if (_position < questionList.length - 1) {
      _position++;
    } else {
      Alert(
        context: context,
        title: 'Finished the quiz!',
        buttons: [
          DialogButton(
            child: Text('Done'),
            onPressed: () {
              return {
                _position = 0,
              scoreKeeper = []
              };
            },
          ),
        ],
      ).show();
    }
    return _position;
  }

  Icon createRightAnswerIcon() {
    return Icon(Icons.check, color: Colors.green);
  }

  Icon createWrongAnswerIcon() {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  void checkUsersAnswer(bool userAnswer) {
    bool correctAnswer = questionList[_position].questionAnswer;
    Icon icon;
    print("User's answer: $userAnswer");
    if (correctAnswer == userAnswer) {
      icon = QuizController().createRightAnswerIcon();
    } else {
      icon = QuizController().createWrongAnswerIcon();
    }
    scoreKeeper.add(icon);
  }
}
