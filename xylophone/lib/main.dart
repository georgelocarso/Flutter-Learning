import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(XylophoneApp()));
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Future<void> playSound(int soundNum) async {
    final player = AudioPlayer();

    await player.setSource(AssetSource('note$soundNum.wav'));
    await player.resume();
  }

  Expanded buildKey({int soundNum = 1, required Color color}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound(soundNum);
        },
        child: Text(""),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNum: 1, color: Colors.red),
              buildKey(soundNum: 2, color: Colors.orange),
              buildKey(soundNum: 3, color: Colors.yellow),
              buildKey(soundNum: 4, color: Colors.green),
              buildKey(soundNum: 5, color: Colors.teal),
              buildKey(soundNum: 6, color: Colors.blue),
              buildKey(soundNum: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
