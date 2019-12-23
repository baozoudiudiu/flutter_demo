import 'package:flutter/material.dart';
import 'chip_page.dart';
import 'action_chip_page.dart';
import 'filter_chip_page.dart';
import 'dataTable_page.dart';

class MDCPage extends StatefulWidget {
  @override
  _MDCPageState createState() => _MDCPageState();
}

class _MDCPageState extends State<MDCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MDC"),),
      body: ListView.separated(
        itemCount: 30,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2.0,color: Colors.purple,);
        },
        itemBuilder: (BuildContext context, int index) {
          return _itemBuilder(context, index);
        },
      )
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    String str = "";
    if (index == 0) {
      // chips
      str = "chip demo";
      return RaisedButton(
        child: Text(str),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return ChipDemo(str);
          }));
        },
      );
    }else if (index == 1) {
      str = "action chip demo";
      return RaisedButton(
        child: Text(str),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return ActionChipDemo(str);
          }));
        },
      );
    }else if (index == 2) {
      str = "filter chip demo";
      return RaisedButton(
        child: Text(str),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return FilterChipDemo(str);
          }));
        },
      );
    }else if (index == 3) {
      str = "DataTable Demo";
      return RaisedButton(
        child: Text(str),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DataTablePage();
          }));
        },
      );
    }
    return null;
  }
}