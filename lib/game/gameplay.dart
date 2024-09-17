import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const GamePlayApp());

class GamePlayApp extends StatelessWidget {
  const GamePlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GamePlay(),
    );
  }
}

class GamePlay extends StatefulWidget {
  const GamePlay({super.key});

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  int? numberOne;
  int? numberTwo;
  String expression = 'Expression';
  String solution = 'Solution';
  int round = 0;
  String playButtonText = 'Play';

  void generateExpression() {
    setState(() {
      numberOne = Random().nextInt(101);
      numberTwo = Random().nextInt(101);
      expression = '$numberOne + $numberTwo';
      solution = 'Solution';
      round++;
      playButtonText = 'Play Again';
    });
  }

  void solveExpression() {
    if (numberOne != null && numberTwo != null) {
      setState(() {
        solution = (numberOne! + numberTwo!).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment 1"),
        backgroundColor: const Color.fromARGB(255, 58, 76, 242),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Total Rounds: $round', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 20),
            Text(expression, style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            Text(solution, style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              const SizedBox(height: 30),
                CupertinoButton.filled(
                onPressed: generateExpression,
                child: const Text('Play'),
              ),
              const SizedBox(height: 30),
                CupertinoButton.filled(
                onPressed: solveExpression,
                child: const Text('Solve'),
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
