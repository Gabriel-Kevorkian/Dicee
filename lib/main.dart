import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
          centerTitle: true,
          elevation: 10.0,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                child: Image.asset(
                  'images/dice$leftDiceNumber.png',
                ),
                onPressed: () {
                  changeDiceFace();
                },
              ),
            ),
            //Get students to create the second die as a challenge
            Expanded(
              child: TextButton(
                child: Image.asset(
                  'images/dice$rightDiceNumber.png',
                ),
                onPressed: () {
                  changeDiceFace();
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            changeDiceFace();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.red
            ), // Change the background color
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(16)), // Change the padding
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                  fontSize: 20), // Change the text style
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text('Roll Dice'),
        ),
      ],
    );
  }
}
