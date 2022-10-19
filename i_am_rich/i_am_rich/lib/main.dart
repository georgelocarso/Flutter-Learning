import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 144, 249, 242),
        appBar : AppBar(  
          title: Text("I'm Reech"),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: 
          Image(
          image: AssetImage('images/icon.png')
        ),
          )
      ),
    ),
  );
}
