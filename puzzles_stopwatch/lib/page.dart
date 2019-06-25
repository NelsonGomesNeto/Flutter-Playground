import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Page extends StatefulWidget {
  Page({Key key}) : super(key: key);
  void setPuzzle(int selectedPuzzle, bool refresh);
}