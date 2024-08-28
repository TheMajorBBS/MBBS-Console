import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'console_new_widget.dart' show ConsoleNewWidget;
import 'package:flutter/material.dart';

class ConsoleNewModel extends FlutterFlowModel<ConsoleNewWidget> {
  ///  Local state fields for this page.

  bool connected = false;

  String consoleView = 'summary';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? stateTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    stateTime?.cancel();
  }
}
