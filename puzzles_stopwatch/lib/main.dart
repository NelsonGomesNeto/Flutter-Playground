import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(PuzzlesStopwatchApp());

class PuzzlesStopwatchApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Puzzle's Stopwatch",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}