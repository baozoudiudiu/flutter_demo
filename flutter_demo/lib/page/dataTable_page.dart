import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  DataTablePage({Key key}) : super(key: key);

  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                  label: Text("姓名"),
                ),
                DataColumn(
                  label: Text("年龄"),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("chen wang")),
                  DataCell(Text("22")),
                ]),
                DataRow(cells: [
                  DataCell(Text("chen wang222")),
                  DataCell(Text("22222")),
                ]),
                DataRow(cells: [
                  DataCell(Text("chen wang2333")),
                  DataCell(Text("33333")),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
