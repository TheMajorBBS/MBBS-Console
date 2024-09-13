import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'console_widget.dart' show ConsoleWidget;
import 'package:flutter/material.dart';

class ConsoleModel extends FlutterFlowModel<ConsoleWidget> {
  ///  Local state fields for this page.

  bool connected = false;

  String consoleView = 'summary';

  ///  State fields for stateful widgets in this page.

  InstantTimer? stateTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    stateTime?.cancel();
  }
}
