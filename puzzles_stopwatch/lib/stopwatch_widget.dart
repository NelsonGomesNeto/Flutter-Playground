import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StopwatchWidget extends StatefulWidget {
  @override
  _StopwatchWidgetState createState() => _StopwatchWidgetState();
}
  
class _StopwatchWidgetState extends State<StopwatchWidget> {
  Stopwatch _stopwatch = Stopwatch();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _StopwatchText(stopwatch: _stopwatch),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(_stopwatch.isRunning ? "Pause" : "Start"),
                onPressed: () {
                  setState(() {
                    if (_stopwatch.isRunning)
                      _stopwatch.stop();
                    else
                      _stopwatch.start();
                  });
                },
              ),
              RaisedButton(
                child: Text("Reset"),
                onPressed: () {
                  setState(() {
                    _stopwatch.reset();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StopwatchText extends StatefulWidget {
  final Stopwatch stopwatch;
  
  _StopwatchText({this.stopwatch});

  @override
  _StopwatchTextState createState() => _StopwatchTextState(stopwatch: stopwatch);
}
  
class _StopwatchTextState extends State<_StopwatchText> {
  Timer timer;
  final Stopwatch stopwatch;

  _StopwatchTextState({this.stopwatch}) {
    timer = Timer.periodic(new Duration(milliseconds: 30), refresh);
  }

  void refresh(Timer timer) {
    if (stopwatch.isRunning)
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      millisecondsToTimer(stopwatch.elapsedMilliseconds),
      style: TextStyle(fontSize: 64),
    );
  }

  String millisecondsToTimer(int milliseconds) {
    int seconds = milliseconds ~/ 1000;
    int minutes = seconds ~/ 60;
    seconds %= 60; milliseconds %= 1000;
    return(minutes.toString().padLeft(2, '0') + ":" + seconds.toString().padLeft(2, '0') + ":" + milliseconds.toString().padLeft(3, '0'));
  }
}