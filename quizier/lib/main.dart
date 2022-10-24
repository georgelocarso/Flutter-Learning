// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

final quizBrain = QuizBrain();

// bool shouldPop = true; the rflutter couldnt be warp with willpopScope yet, dontknow how

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  Icon trueIcon = Icon(
    Icons.check,
    color: Colors.green,
    size: 40.0,
  );

  Icon falseIcon = Icon(
    Icons.close,
    color: Colors.red,
    size: 40.0,
  );

  void checkAnswer(bool answer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (correctAnswer == answer) {
      score += 100;
      scoreKeeper.add(trueIcon);
    } else {
      score -= 50;
      scoreKeeper.add(falseIcon);
    }

    if (quizBrain.lastQuestion() == true) {
      _onAlertButtonsPressed(context);
    } else {
      quizBrain.nextQuestion();
    }

    print(score);
  }

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Score : $score",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    checkAnswer(true);
                  });
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    checkAnswer(false);
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
          child: Row(children: scoreKeeper),
        ),
      ],
    );
  }

  // _onBasicAlertPressed(context) {
  //   Alert(
  //     context: context,
  //     title: "QUIZEEE",
  //     desc: "Quiz Finished, your score : $score",
  //   ).show();
  // }

  _onAlertButtonsPressed(context) {
    Alert(
      style: AlertStyle(
          isCloseButton: false,
          isOverlayTapDismiss:
              false), //id true dismiss able by taping other area
      context: context,
      type: AlertType.warning,
      title: "QUIZEEE",
      desc:
          "Quiz Finished, your score : $score \n\n\nP.S. DO NOT PRESS BACK, HAVENT FIGUREOUT HOWTO DISABLE BACK AT THIS POPUP\n\n P.S.S. back button disabled :)\n\np.s.s.s only disabled for main ",
      buttons: [
        DialogButton(
          child: Text(
            "Quit Game",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => SystemNavigator.pop(),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);

            setState(() {
              score = 0;
              scoreKeeper.clear();
              quizBrain.restartGame();
            });
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),
        )
      ],
    ).show();
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

// OK TODO: quit game
// OK TODO: restart game (call restart on quizbrain check.)
// OK TODO: random the quistion.
// Alert on Exit

