import 'package:flutter/material.dart';
import 'package:offline_lead_capture/pages/create/create-lead-file.screen.dart';
import 'package:offline_lead_capture/pages/home.screen.dart';
import 'package:offline_lead_capture/pages/view.screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (BuildContext context) => Home(),
      '/view': (BuildContext context) => View(),
      '/create-lead-file': (BuildContext context) => CreateLeadFile(),
    };
  }
}
