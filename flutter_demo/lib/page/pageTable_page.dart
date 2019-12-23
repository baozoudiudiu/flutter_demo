import 'package:flutter/material.dart';
import '../model/models.dart';

class PageDataTablePage extends StatefulWidget {
  PageDataTablePage({Key key}) : super(key: key);

  @override
  _PageDataTablePageState createState() => _PageDataTablePageState();
}

class _PageDataTablePageState extends State<PageDataTablePage> {
  final _source = MySource();

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
            PaginatedDataTable(
              header: Text("Header"),
              rowsPerPage: 5,
              source: _source,
              columns: [
                DataColumn(
                  label: Text("标题一")
                ),
                DataColumn(
                  label: Text("标题二")
                ),
                DataColumn(
                  label: Text("图片")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class MySource extends DataTableSource {
  @override
  int get rowCount => postDataArr.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  DataRow getRow(int index) {
    PostModel model = postDataArr[index];
    return DataRow(
      cells: [
        DataCell(Text(model.title)),
        DataCell(Text(model.subTitle)),
        DataCell(Image.network(model.imgUrl)),
      ]
    );
  }

  @override
  int get selectedRowCount => 0;
}