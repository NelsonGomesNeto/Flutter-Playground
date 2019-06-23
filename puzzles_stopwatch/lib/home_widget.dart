import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puzzles_stopwatch/stopwatch_widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    StopwatchWidget(),
    Text("Statistics", style: TextStyle(fontSize: 64),), // TODO Statistics
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puzzle's Stopwatch"),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text("Stopwatch"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            title: Text("Statistics"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        }
      ),
    );
  }
}