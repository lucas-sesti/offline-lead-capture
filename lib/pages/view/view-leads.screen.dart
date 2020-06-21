import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_lead_capture/core/widgets/lead-card.widget.dart';
import 'package:offline_lead_capture/pages/view/view-lead.screen.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  List<FileSystemEntity> files = new List();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    Directory documents = await getApplicationDocumentsDirectory();
    _listofFiles(documents.path);
  }

  void _listofFiles(directory) async {
    setState(() {
      files = Directory("$directory/leads").listSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 36,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(6),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        CupertinoIcons.left_chevron,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 28,
                      ),
                      child: Text(
                        'Lista de Leads',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: files.map<Widget>((file) {
                      final List splittedFilename =
                          basename(file.path).split('.');

                      final String filename = splittedFilename[0];
                      final String fileExtension = splittedFilename[1];

                      return Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: GestureDetector(
                          onTap: () async {
                            setState(() => loading = true);
                            Directory documents =
                                await getApplicationDocumentsDirectory();

                            OpenFile.open(
                              "${documents.path}/leads/$filename.$fileExtension",
                            ).whenComplete(
                              () => setState(() => loading = false),
                            );
                          },
                          child: LeadCard(
                            filename: filename,
                            fileExtension: fileExtension,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
