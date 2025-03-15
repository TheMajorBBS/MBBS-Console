import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'kill_screen_modal_widget.dart' show KillScreenModalWidget;
import 'package:flutter/material.dart';

class KillScreenModalModel extends FlutterFlowModel<KillScreenModalWidget> {
  ///  Local state fields for this component.

  bool channelKill = false;

  bool systemKill = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for killchannel widget.
  FocusNode? killchannelFocusNode;
  TextEditingController? killchannelTextController;
  String? Function(BuildContext, String?)? killchannelTextControllerValidator;
  // State field(s) for KillSystem widget.
  String? killSystemValue;
  FormFieldController<String>? killSystemValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    killchannelFocusNode?.dispose();
    killchannelTextController?.dispose();
  }
}
