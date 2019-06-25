import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puzzles_stopwatch/page.dart';
import 'package:puzzles_stopwatch/stopwatch_widget.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedPage = 0, _selectedPuzzle = 0;
  List<Page> _pages = <Page>[
    StopwatchWidget(0, "1", key: Key("1"),),
    StopwatchWidget(0, "2", key: Key("2"),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DropdownButton<int>(
          style: TextStyle(fontSize: 24, color: Colors.black),
          value: _selectedPuzzle,
          onChanged: (int newValue) {
            setState(() { 
              _selectedPuzzle = newValue;
              for (int i = 0; i < _pages.length; i ++)
                _pages[i].setPuzzle(_selectedPuzzle, i == _selectedPage);
            });
          },
          items: ["3x3", "5x5"].asMap().entries.map<DropdownMenuItem<int>>((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
        ),
      ),
      body: Center(
        child: _pages[_selectedPage],
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
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        }
      ),
    );
  }
}