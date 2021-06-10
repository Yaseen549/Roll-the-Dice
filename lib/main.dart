import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
          title: Text('Roll the Dice'),
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
          child: DiceApp(),
        ),
      ),
    ),
  );
}

class DiceApp extends StatefulWidget {
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  bool match;
  String answer = "";

  void changeDiceFaces() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });

    if(leftDiceNumber == rightDiceNumber){
      answer = "It's a Match! ✔";
    }
    else{
      answer = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Dice 1',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        onPressed: () {
                          changeDiceFaces();
                        },
                        child: Image.asset('images/dice$leftDiceNumber.png'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        ' $leftDiceNumber ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Dice 2',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        onPressed: () {
                          changeDiceFaces();
                        },
                        child: Image.asset('images/dice$rightDiceNumber.png'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        ' $rightDiceNumber ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30.0,
            ),

            // Answer
            Container(
              height: 35.0,
              // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " $answer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
