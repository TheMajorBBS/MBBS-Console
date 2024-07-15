import '/flutter_flow/flutter_flow_util.dart';
import 'console_widget.dart' show ConsoleWidget;
import 'package:flutter/material.dart';

class ConsoleModel extends FlutterFlowModel<ConsoleWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
