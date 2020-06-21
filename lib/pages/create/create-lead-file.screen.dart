import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_lead_capture/blocs/lead.bloc.dart';

class CreateLeadFile extends StatefulWidget {
  @override
  _CreateLeadFileState createState() => _CreateLeadFileState();
}

class _CreateLeadFileState extends State<CreateLeadFile> {
  final LeadBloc leadBloc = BlocProvider.getBloc<LeadBloc>();
  final TextEditingController filenameController = TextEditingController();
  final FocusNode filenameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    leadBloc.setFilenameController(filenameController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 36,
          ),
          child: ListView(
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
                          'Cadastrar Leads',
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
              TextFormField(
                controller: filenameController,
                focusNode: filenameFocus,
                decoration: InputDecoration(
                  hintText: 'Nome do arquivo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
                child: Text(
                  '*Obs: Este será o nome do arquivo em que será salvo as informações',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => leadBloc.createFile(),
                child: Text('Criar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
