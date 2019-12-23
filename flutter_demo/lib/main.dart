import 'package:flutter/material.dart';
import 'page/input_page.dart';
import 'page/dailog_page.dart';
import 'page/mdc_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter学习demo",
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> dataArr = [
    "[11] - 输入",
    "[12] - 对话框",
    "[13] - MDC",
    "[14] - 状态管理"
  ];

  void _listViewClick(BuildContext context, int index) {
    if (index == 0) {
      // 输入
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return InputPage();
      }));
    } else if (1 == index) {
      // 对话框
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return DailogPage();
      }));
    }else if (2 == index) {
      Navigator.of(context).push(MaterialPageRoute(builder: (contenxt){
        return MDCPage();
      })); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter demo"),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.orange,
            height: 1.0,
          );
        },
        itemCount: dataArr.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(dataArr[index]),
            onTap: () {
              _listViewClick(context, index);
            },
          );
        },
      ),
    );
  }
}
