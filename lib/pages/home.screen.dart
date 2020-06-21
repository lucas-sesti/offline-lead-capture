import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/create-lead-file');
              },
              child: Text('Criar'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/view');
              },
              child: Text('Visualizar'),
            ),
            // RaisedButton(
            //   onPressed: () async {
            //     Excel excel = Excel.createExcel();
                // Directory documents = await getApplicationDocumentsDirectory();

                // final Sheet sheet = excel['mySheet'];
                // final Data cell = sheet.cell(CellIndex.indexByString("A1"));
                // cell.value = "Teste";

                // print(documents.path);

                // excel.encode().then((value) {
                //   File(join('${documents.path}/leads/1.xlsx'))
                //     ..createSync(recursive: true)
                //     ..writeAsBytesSync(value);
                // });
            //   },
            //   child: Text('Criar excel'),
            // )
          ],
        ),
      ),
    );
  }
}
