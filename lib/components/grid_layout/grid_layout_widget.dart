import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'grid_layout_model.dart';
export 'grid_layout_model.dart';

class GridLayoutWidget extends StatefulWidget {
  const GridLayoutWidget({super.key});

  @override
  State<GridLayoutWidget> createState() => _GridLayoutWidgetState();
}

class _GridLayoutWidgetState extends State<GridLayoutWidget> {
  late GridLayoutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridLayoutModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 180.0,
      height: 420.0,
      decoration: const BoxDecoration(),
      child: Builder(
        builder: (context) {
          final chnnelGridList = FFAppState().channelLogList.toList();

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 16,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 200 / 440,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: chnnelGridList.length,
            itemBuilder: (context, chnnelGridListIndex) {
              final chnnelGridListItem = chnnelGridList[chnnelGridListIndex];
              return Text(
                chnnelGridListItem.character,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Courier Prime',
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                    ),
              );
            },
          );
        },
      ),
    );
  }
}
