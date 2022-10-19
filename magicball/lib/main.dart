import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[700],
        appBar: AppBar(
          title: Text('MagicBall'),
          backgroundColor: Colors.blue[300],
        ),
        body: MagicBall(),
      ),
    ),
  );
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballRandom = 1;

  void randomIt() {
    setState(() {
      ballRandom = Random().nextInt(5) + 1;
      print(ballRandom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white10,
            padding: EdgeInsets.all(30),
          ),
          onPressed: () {
            randomIt();
          },
          child: Image.asset('images/ball$ballRandom.png'),
        )),
      ),
    );
  }
}
