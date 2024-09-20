import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'main_console_widget.dart' show MainConsoleWidget;
import 'package:flutter/material.dart';

class MainConsoleModel extends FlutterFlowModel<MainConsoleWidget> {
  ///  Local state fields for this page.

  String sideNav = 'summary';

  ///  State fields for stateful widgets in this page.

  InstantTimer? stateTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    stateTime?.cancel();
  }
}
