import 'dart:async';
import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:offline_lead_capture/core/models/lead.model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';

class LeadBloc extends BlocBase {
  final BehaviorSubject<Lead> registerLeadForm =
      BehaviorSubject<Lead>.seeded(Lead());

  Lead get formValue => registerLeadForm.value;
  StreamSink<Lead> get input => registerLeadForm.sink;

  void createFile() async {
    Directory documents = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = _listofFiles(documents.path);

    bool alreadyHaveFile = false;

    files.forEach((element) {
      List splittedFile = basename(element.path).split('.');

      if (splittedFile[0] == formValue.filename) {
        alreadyHaveFile = true;
      }
    });

    if (alreadyHaveFile) {
      return;
    }

    Excel excel = Excel.createExcel();

    final Sheet sheet = excel['Leads'];
    final CellStyle cellStyle = CellStyle(
      bold: true,
      fontSize: 20,
      verticalAlign: VerticalAlign.Center,
    );

    final Data cellName = sheet.cell(CellIndex.indexByString("A1"));
    final Data cellEmail = sheet.cell(CellIndex.indexByString("B1"));
    final Data cellPhone = sheet.cell(CellIndex.indexByString("C1"));
    final Data cellRG = sheet.cell(CellIndex.indexByString("D1"));
    final Data cellCPF = sheet.cell(CellIndex.indexByString("E1"));

    cellName.value = 'Nome';
    cellEmail.value = 'Email';
    cellPhone.value = 'Phone';
    cellRG.value = 'RG';
    cellCPF.value = 'CPF';
    cellName.style = cellStyle;
    cellEmail.style = cellStyle;
    cellPhone.style = cellStyle;
    cellRG.style = cellStyle;
    cellCPF.style = cellStyle;

    excel.encode().then((value) {
      File(join('${documents.path}/leads/${formValue.filename}.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(value);
    });
  }

  List<FileSystemEntity> _listofFiles(directory) {
    return Directory("$directory/leads").listSync();
  }

  void setFilename(String filename) {
    this.registerLeadForm.value.filename = filename;
    this.input.add(this.registerLeadForm.value);
  }

  void setFilenameController(TextEditingController filename) {
    filename.addListener(() => setFilename(filename.text));
  }

  @override
  void dispose() {
    registerLeadForm.close();
    super.dispose();
  }
}
