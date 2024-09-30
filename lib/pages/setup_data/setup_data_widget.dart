import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'setup_data_model.dart';
export 'setup_data_model.dart';

class SetupDataWidget extends StatefulWidget {
  const SetupDataWidget({super.key});

  @override
  State<SetupDataWidget> createState() => _SetupDataWidgetState();
}

class _SetupDataWidgetState extends State<SetupDataWidget> {
  late SetupDataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetupDataModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().channelLogList = [];
      FFAppState().addToAuditLogList(AuditStruct(
        datetime: getCurrentTimestamp,
        data: 'Audit Log Started',
        channel: 'Chan 00',
        user: 'Sysop',
      ));
      safeSetState(() {});
      FFAppState().channelLogList =
          functions.initialChannelList().toList().cast<ChannelStruct>();
      safeSetState(() {});
      FFAppState().currentSearchUser = UserRecordStruct(
        name: 'Robert',
        addr1: 'FLIPNET',
        addr2: '123 Test Street',
        addr3: 'Gainesville, GA 30506',
        addr4: 'A',
        phone: '6781234567',
        born: DateTime.fromMicrosecondsSinceEpoch(1727668800000000),
        sex: 'M',
        defaultEditor: 'FSE',
        system: 'IBM PC',
        screen: '80 x 24',
        screen2: 'A',
        screen3: 'A',
        userClass: 'USER',
        passwd: '*********',
        creditAvail: 0,
        creditTotal: 0,
        creditsPaid: 0,
        hasMaster: 'NO',
        suspended: 'NO',
        tagForKill: 'NO',
        protected: 'NO',
        username: 'compguy',
        acctCreated: DateTime.fromMicrosecondsSinceEpoch(1727668800000000),
        lastCall: DateTime.fromMicrosecondsSinceEpoch(1727668800000000),
        dayUsage: 0.0,
      );
      safeSetState(() {});

      context.pushNamed('mainConsole');

      FFAppState().updateUseyAtIndex(
        0,
        (_) => 0.0,
      );
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                child: Text(
                  'Setting Up Data',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Courier Prime',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: CircularPercentIndicator(
                    percent: 0.5,
                    radius: 60.0,
                    lineWidth: 12.0,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    backgroundColor: FlutterFlowTheme.of(context).accent4,
                    center: Text(
                      '50%',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Courier Prime',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
