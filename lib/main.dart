import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:offline_lead_capture/blocs/main.bloc.dart';
import 'package:offline_lead_capture/routes/main.routes.dart';

void main() {
  runApp(OfflineLeadCapture());
}

class OfflineLeadCapture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: Blocs.getBlocs(),
      child: MaterialApp(
        title: 'Offline lead capture',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoutes(),
      ),
    );
  }
}
