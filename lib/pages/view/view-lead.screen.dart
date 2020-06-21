import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

class ViewLead extends StatefulWidget {
  final Excel excel;

  ViewLead(this.excel);

  @override
  _ViewLeadState createState() => _ViewLeadState();
}

class _ViewLeadState extends State<ViewLead> {
  String mainTable = 'Leads';
  int rowsCount = 0;
  int colsCount = 0;
  List fields = [];

  @override
  void initState() {
    super.initState();
    rowsCount = widget.excel.tables[mainTable].maxRows;
    colsCount = widget.excel.tables[mainTable].maxCols;
    fields = widget.excel.tables[mainTable].rows[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      colsCount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      colsCount == 1 ? 'Coluna' : 'Colunas',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      rowsCount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      rowsCount == 1 ? 'Linha' : 'Linhas',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: fields.map((field) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        field.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: fields.map((field) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        field.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
