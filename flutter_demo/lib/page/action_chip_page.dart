import 'package:flutter/material.dart';

class ActionChipDemo extends StatefulWidget {
  final String _titleString;
  ActionChipDemo(this._titleString, {Key key}) : super(key: key);

  @override
  _ActionChipDemoState createState() => _ActionChipDemoState(_titleString);
}

class _ActionChipDemoState extends State<ActionChipDemo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _titleString;
  _ActionChipDemoState(this._titleString);

  List<String> dataArr = [
    "apple",
    "bannal",
    "orange",
    "lemon",
  ];

  void _chipClick(String str) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(str),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleString),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: dataArr.map((str) {
            return ActionChip(
              label: Text(str),
              onPressed: () {
                _chipClick(str);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}


