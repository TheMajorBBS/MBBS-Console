import '/components/grid_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'channel_grid_widget.dart' show ChannelGridWidget;
import 'package:flutter/material.dart';

class ChannelGridModel extends FlutterFlowModel<ChannelGridWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for gridLayout component.
  late GridLayoutModel gridLayoutModel;

  @override
  void initState(BuildContext context) {
    gridLayoutModel = createModel(context, () => GridLayoutModel());
  }

  @override
  void dispose() {
    gridLayoutModel.dispose();
  }
}
