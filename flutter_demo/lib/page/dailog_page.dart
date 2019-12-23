import 'package:flutter/material.dart';

class DailogPage extends StatefulWidget {
  @override
  _DailogPageState createState() => _DailogPageState();
}

class _DailogPageState extends State<DailogPage> {
  void _simpleDialog() async {
    int option = await showDialog(
        context: context,
        child: SimpleDialog(
          title: Text('我是标题'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("i'm option A"),
              onPressed: () {
                Navigator.pop(context, 0);
              },
            ),
            SimpleDialogOption(
              child: Text("i'm option B"),
              onPressed: () {
                Navigator.pop(context, 1);
              },
            ),
            SimpleDialogOption(
              child: Text("i'm option C"),
              onPressed: () {
                Navigator.pop(context, 2);
              },
            ),
          ],
        ));
    print(option);
  }

  void _openAlertDialog() async {
    int option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("i'm title"),
            content: Text("i'm content"),
            actions: <Widget>[
              FlatButton(
                child: Text("cancel"),
                onPressed: () {
                  Navigator.pop(context, 0);
                },
              ),
              FlatButton(
                child: Text("ok"),
                onPressed: () {
                  Navigator.pop(context, 1);
                },
              )
            ],
          );
        });
    print(option);
  }

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  void _openModalBottomSheet() async {
    String option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.purple,
            height: 300.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("option A"),
                  onTap: () {
                    Navigator.pop(context, "A");
                  },
                ),
                ListTile(
                  title: Text("option B"),
                  onTap: () {
                    Navigator.pop(context, "B");
                  },
                ),
                ListTile(
                  title: Text("option C"),
                  onTap: () {
                    Navigator.pop(context, "C");
                  },
                ),
                ListTile(
                  title: Text("option D"),
                  onTap: () {
                    Navigator.pop(context, "D");
                  },
                ),
              ],
            ),
          );
        });
    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(title: Text("对话框")),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            height: 1.0,
          );
        },
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _simpleDialog();
                  },
                  child: Text("SimpleDialog"),
                )
              ],
            );
          } else if (1 == index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("open alert dialog"),
                    onPressed: () {
                      _openAlertDialog();
                    })
              ],
            );
          } else if (2 == index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("bottomSheet"),
                  onPressed: () {
                    _bottomSheetScaffoldKey.currentState
                        .showBottomSheet((BuildContext context) {
                      return BottomAppBar(
                        child: Container(
                          color: Colors.purple,
                          height: 90.0,
                          width: double.infinity,
                          padding: EdgeInsets.all(16.0),
                          child: Text("i'm bottomSheet"),
                        ),
                      );
                    });
                  },
                ),
              ],
            );
          } else if (3 == index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("open modal bottom sheet"),
                  onPressed: () {
                    _openModalBottomSheet();
                  },
                ),
              ],
            );
          } else if (4 == index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("open snak bar"),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("i'm snak bar,我会自行消失"),
                      action: SnackBarAction(
                        label: "我是按钮",
                        onPressed: () {},
                      ),
                    ));
                  },
                ),
              ],
            );
          } else if (5 == index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("open expansion panel"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ExpansionPanelDemo();
                    }));
                  },
                ),
              ],
            );
          }
          return null;
        },
      ),
    );
  }
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool _isOpenA = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isOpen) {
                setState(() {
                  _isOpenA = !isOpen;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isOpen) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("我是头部"),
                    );
                  },
                  body: Text("i'm body"),
                  isExpanded: _isOpenA,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isOpen) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("我是头部1"),
                    );
                  },
                  body: Text("i'm body"),
                  isExpanded: _isOpenA,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isOpen) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("我是头部2"),
                    );
                  },
                  body: Text("i'm body"),
                  isExpanded: _isOpenA,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
