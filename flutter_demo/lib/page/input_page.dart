import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _openA = false;
  bool _openB = false;
  int _radioValue = 0;
  int _radioListTileValue = 0;
  bool _switchOpen = false;
  double _sliderValue = 0.0;
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入"),
      ),
      body: ListView(
        children: <Widget>[
          Text("Checkbox"),
          Checkbox(
            value: _openA,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              setState(() {
                _openA = value;
              });
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("CheckboxListTile"),
          CheckboxListTile(
            value: _openB,
            title: Text("我是title"),
            subtitle: Text("我是subTitle"),
            onChanged: (newValue) {
              setState(() {
                _openB = newValue;
              });
            },
            secondary: Icon(Icons.bookmark),
            selected: _openB,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("Radio"),
          Row(
            children: <Widget>[
              Radio(
                value: 0,
                onChanged: (value) {
                  setState(() {
                    _radioValue = value;
                  });
                },
                groupValue: _radioValue,
              ),
              Radio(
                value: 1,
                onChanged: (value) {
                  setState(() {
                    _radioValue = value;
                  });
                },
                groupValue: _radioValue,
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("RadioListTitle"),
          RadioListTile(
            value: 0,
            groupValue: _radioListTileValue,
            onChanged: (value) {
              setState(() {
                _radioListTileValue = value;
              });
            },
            title: Text("我是title"),
            subtitle: Text("我是subTitle"),
            secondary: Icon(Icons.bookmark),
            selected: _radioListTileValue == 0,
          ),
          RadioListTile(
            value: 1,
            groupValue: _radioListTileValue,
            onChanged: (value) {
              setState(() {
                _radioListTileValue = value;
              });
            },
            title: Text("我是title"),
            subtitle: Text("我是subTitle"),
            secondary: Icon(Icons.markunread),
            selected: _radioListTileValue == 1,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("Switch"),
          Container(
            child: Switch(
              value: _switchOpen,
              onChanged: (value) {
                setState(() {
                  _switchOpen = value;
                });
              },
              activeColor: Colors.cyan,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("SwitchListTile"),
          SwitchListTile(
            value: _switchOpen,
            onChanged: (value) {
              setState(() {
                _switchOpen = value;
              });
            },
            title: Text("我是title"),
            subtitle: Text("我是subTitle"),
            secondary: Icon(Icons.youtube_searched_for),
            selected: _switchOpen,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("slider"),
          Slider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          InkWell(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (null == date) {return;}
              setState(() {
                _dateTime = date;
              });   
            },
            child: Row(
              children: <Widget>[
                Text(DateFormat.yMd().format(_dateTime)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
