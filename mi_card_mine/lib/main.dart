// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 75.0,
                    // ignore: duplicate_ignore, sort_child_properties_last
                    // child: Container(
                    //   // ignore: prefer_const_constructors
                    //   padding: EdgeInsets.all(40),
                    //   // ignore: prefer_const_constructors
                    //   child: Image(
                    //     image: AssetImage('images/logo.png'),
                    //   ),
                    // ),
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'George Locarso',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Raleway Light',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'Soon to be Senior Developer',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway Bold',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 400,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  IntrinsicWidth(
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 20.0,
                        // ),
                        // Container(
                        //   color: Colors.white,
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.phone_iphone_outlined,
                        //         size: 60,
                        //         color: Colors.teal.shade900,
                        //       ),
                        //       SizedBox(width: 10),
                        //       Text(
                        //         "+62 789 545 523",
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           color: Colors.teal.shade900,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 15.0,
                        // ),
                        // Container(
                        //   color: Colors.white,
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.email_outlined,
                        //         size: 60,
                        //         color: Colors.teal.shade900,
                        //       ),
                        //       SizedBox(width: 10),
                        //       Text(
                        //         "georgelocarso@gmail.com",
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           color: Colors.teal.shade900,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 15.0,
                        ),
                        // ABOVE AWAS THE COLUMN AND ROW MADED
                        // CARD WITH LIST TILE
                        Card(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: ListTile(
                                leading: Icon(
                                  Icons.email_outlined,
                                  size: 60,
                                  color: Colors.teal.shade900,
                                ),
                                title: Text(
                                  "georgelocarso@gmail.com",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.teal.shade900,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
