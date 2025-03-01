import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'main_console_widget.dart' show MainConsoleWidget;
import 'package:flutter/material.dart';

class MainConsoleModel extends FlutterFlowModel<MainConsoleWidget> {
  ///  Local state fields for this page.

  String sideNav = 'summary';

  bool editName = false;

  Color nameFieldColorBg = Color(4278190251);

  Color nameFieldColorTxt = Color(4281979584);

  bool editAdd1 = false;

  bool editAdd2 = false;

  bool editAdd3 = false;

  bool editAdd4 = false;

  bool editPhone = false;

  bool editMaster = false;

  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();
  InstantTimer? stateTime;
  // State field(s) for GridView widget.
  ScrollController? gridViewController1;
  // State field(s) for ListViewAudit widget.
  ScrollController? listViewAudit;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for GridView widget.
  ScrollController? gridViewController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for Name_Field widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for Add1_Field widget.
  FocusNode? add1FieldFocusNode;
  TextEditingController? add1FieldTextController;
  String? Function(BuildContext, String?)? add1FieldTextControllerValidator;
  // State field(s) for Add2_Field widget.
  FocusNode? add2FieldFocusNode;
  TextEditingController? add2FieldTextController;
  String? Function(BuildContext, String?)? add2FieldTextControllerValidator;
  // State field(s) for Add3_Field widget.
  FocusNode? add3FieldFocusNode;
  TextEditingController? add3FieldTextController;
  String? Function(BuildContext, String?)? add3FieldTextControllerValidator;
  // State field(s) for Add4_Field widget.
  FocusNode? add4FieldFocusNode;
  TextEditingController? add4FieldTextController;
  String? Function(BuildContext, String?)? add4FieldTextControllerValidator;
  // State field(s) for Phone_Field widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  // State field(s) for master_field_dd widget.
  String? masterFieldDdValue;
  FormFieldController<String>? masterFieldDdValueController;

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
    gridViewController1 = ScrollController();
    listViewAudit = ScrollController();
    listViewController1 = ScrollController();
    gridViewController2 = ScrollController();
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    stateTime?.cancel();
    gridViewController1?.dispose();
    listViewAudit?.dispose();
    listViewController1?.dispose();
    gridViewController2?.dispose();
    listViewController2?.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    add1FieldFocusNode?.dispose();
    add1FieldTextController?.dispose();

    add2FieldFocusNode?.dispose();
    add2FieldTextController?.dispose();

    add3FieldFocusNode?.dispose();
    add3FieldTextController?.dispose();

    add4FieldFocusNode?.dispose();
    add4FieldTextController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();
  }
}
