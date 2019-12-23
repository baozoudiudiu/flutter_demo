import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  final String titleString;
  ChipDemo(this.titleString, {Key key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState(titleString);
}

class _ChipDemoState extends State<ChipDemo> {
  final String titleString;
  _ChipDemoState(this.titleString);
  List<String> dataArr;

  @override
  void initState() {
    super.initState();
    this._resetData();
  }

  void _resetData() {
    dataArr = [
      "apple",
      "bannal",
      "orange",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleString),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text("啊啊啊"),
                ),
                Chip(
                  label: Text("收款方结算单"),
                  backgroundColor: Colors.yellow,
                ),
                Chip(
                    label: Text("收款方结算单"),
                    avatar: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                      padding: EdgeInsets.all(4.0),
                      child: Text("旺"),
                    )),
                Chip(
                  label: Text("可以删除的chip"),
                  onDeleted: () {},
                ),
                Divider(
                  height: 3.0,
                  color: Colors.orange,
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: dataArr.map((str) {
                    return Chip(
                      label: Text(str),
                      onDeleted: () {
                        setState(() {
                          dataArr.remove(str);
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            this._resetData();
          });
        },
      ),
    );
  }
}
