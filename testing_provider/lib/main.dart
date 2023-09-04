import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: SafeArea(
            child: Scaffold(
          appBar: AppBar(title: Text("title")),
          body: Level1(),
          backgroundColor: Colors.lightGreen,
        )),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        TextField(onChanged: (newValue) {
          Provider.of<Data>(context, listen: false).changeString(newValue);
        }),
        SizedBox(
          height: 10,
        ),
        Level3()
      ]),
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Text(Provider.of<Data>(context, listen: true).data)
      ),
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
