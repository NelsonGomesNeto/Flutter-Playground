import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puzzles_stopwatch/page.dart';

class StopwatchWidget extends Page {
  int _selectedPuzzle;
  int rebuildCounter = 0;
  final String _pageText;
  _StopwatchWidgetState _stopwatchWidgetState;
  StopwatchWidget(this._selectedPuzzle, this._pageText, {Key key}) : super(key: key);

  @override
  _StopwatchWidgetState createState() {
    return _stopwatchWidgetState = _StopwatchWidgetState(_selectedPuzzle, _pageText, rebuildCounter++);
  }

  @override
  void setPuzzle(int selectedPuzzle, bool refresh) {
    if (refresh)
      _stopwatchWidgetState.setPuzzle(_selectedPuzzle = selectedPuzzle);
    else
      _selectedPuzzle = selectedPuzzle;
  }
}
  
class _StopwatchWidgetState extends State<StopwatchWidget> {
  int _selectedPuzzle;
  int _rebuildCounter;
  final String _pageText;
  Stopwatch _stopwatch = Stopwatch();
  _StopwatchWidgetState(this._selectedPuzzle, this._pageText, this._rebuildCounter);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("rebuilt: " + _rebuildCounter.toString(), style: TextStyle(fontSize: 64),),
          Text("page: " + _pageText, style: TextStyle(fontSize: 64),),
          Text("puzzle: " + _selectedPuzzle.toString(), style: TextStyle(fontSize: 64),),
          StopwatchText(stopwatch: _stopwatch),
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

  void setPuzzle(int selectedPuzzle) {
    setState(() {
      this._selectedPuzzle = selectedPuzzle;
    });
  }
}

class StopwatchText extends StatefulWidget {
  final Stopwatch stopwatch;
  
  StopwatchText({this.stopwatch});

  @override
  _StopwatchTextState createState() => _StopwatchTextState(stopwatch: stopwatch);
}
  
class _StopwatchTextState extends State<StopwatchText> {
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