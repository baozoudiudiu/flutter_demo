import 'package:flutter/material.dart';

class FilterChipDemo extends StatefulWidget {
  final String _titleString;
  FilterChipDemo(this._titleString, {Key key}) : super(key: key);

  @override
  _FilterChipDemoState createState() => _FilterChipDemoState(_titleString);
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  final String _titleString;
  _FilterChipDemoState(this._titleString);
  List<String> filterDataArr;
  var filterSelectedArr = List<String>();

  void _resetData() {
    this.filterDataArr = [
      "apple",
      "bannal",
      "lemon",
      "orange",
    ];
    if (this.filterSelectedArr.isEmpty == false) {
      for (int i = 0; i >= 0; i--) {
        this.filterSelectedArr.removeAt(i);
      }
    }
  }

  @override
  void initState() {
    this._resetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleString),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: <Widget>[
            Text("filter chip demo:"),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: filterDataArr.map((str) {
                    return FilterChip(
                      label: Text(str),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            this.filterSelectedArr.add(str);
                          } else {
                            this.filterSelectedArr.remove(str);
                          }
                        });
                      },
                      selected: this.filterSelectedArr.contains(str),
                    );
                  }).toList(),
                ),
              ],
            ),
            Divider(height: 8.0,color: Colors.orange,),

            Text("Choice Chip Demo:"),
            Column(
              
            ),
          ],
        ),
      ),
    );
  }
}
