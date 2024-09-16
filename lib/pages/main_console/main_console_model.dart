import '/components/channel_grid_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'main_console_widget.dart' show MainConsoleWidget;
import 'package:flutter/material.dart';

class MainConsoleModel extends FlutterFlowModel<MainConsoleWidget> {
  ///  Local state fields for this page.

  String sideNav = 'summary';

  ///  State fields for stateful widgets in this page.

  InstantTimer? stateTime;
  // Model for channelGrid component.
  late ChannelGridModel channelGridModel;

  @override
  void initState(BuildContext context) {
    channelGridModel = createModel(context, () => ChannelGridModel());
  }

  @override
  void dispose() {
    stateTime?.cancel();
    channelGridModel.dispose();
  }
}
