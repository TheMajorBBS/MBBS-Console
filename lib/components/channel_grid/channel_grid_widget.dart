import '/components/grid_layout/grid_layout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'channel_grid_model.dart';
export 'channel_grid_model.dart';

class ChannelGridWidget extends StatefulWidget {
  const ChannelGridWidget({super.key});

  @override
  State<ChannelGridWidget> createState() => _ChannelGridWidgetState();
}

class _ChannelGridWidgetState extends State<ChannelGridWidget> {
  late ChannelGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelGridModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      height: 440.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        border: Border.all(
          color: const Color(0xFF57FFFF),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                decoration: const BoxDecoration(),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '0',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '1',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '2',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '3',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '4',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '5',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '6',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '7',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '8',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '9',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  'A',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  'B',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  'C',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  'D',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  'E',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Text(
                'F',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Courier Prime',
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '0',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '1',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '2',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '3',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '4',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '5',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '6',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '7',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '8',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '9',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'A',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'B',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'C',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'D',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'E',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'F',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Courier Prime',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  width: 335.0,
                  height: 420.0,
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.gridLayoutModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const GridLayoutWidget(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
