import 'package:flutter/material.dart';
import '../model/models.dart';

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
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              dataRowHeight: 64,
              columns: [
                DataColumn(
                  label: Text("标题一"),
                ),
                DataColumn(
                  label: Text("标题二"),
                ),
                DataColumn(
                  label: Text("图片"),
                ),
              ],
              rows: postDataArr.map((item) {
                return DataRow(
                  cells: [
                    DataCell(Text(item.title)),
                    DataCell(Text(item.subTitle)),
                    DataCell(Image.network(item.imgUrl)),
                    // DataCell(Text(item.subTitle)),
                  ]
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
