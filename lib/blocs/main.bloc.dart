import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:offline_lead_capture/blocs/lead.bloc.dart';

class Blocs {
  static List<Bloc<dynamic>> getBlocs() {
    return [
      Bloc((i) => LeadBloc()),
    ];
  }
}
