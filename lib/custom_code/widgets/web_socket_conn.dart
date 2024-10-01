// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:web_socket_channel/web_socket_channel.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketConn extends StatefulWidget {
  const WebSocketConn({
    super.key,
    this.width,
    this.height,
    this.systemIP,
    this.systemPort,
    this.isSecure,
  });

  final double? width;
  final double? height;
  final String? systemIP;
  final int? systemPort;
  final bool? isSecure;

  @override
  State<WebSocketConn> createState() => _WebSocketConnState();
}

class _WebSocketConnState extends State<WebSocketConn> {
  String myUrl = '';
  String myext = 'ws://';
  String myMessage = 'Connecting...';
  String myuser = '';
  String mypass = '';
  late WebSocketChannel _channel;
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    myMessage = 'Connecting...';
    myuser = FFAppState().username;
    mypass = FFAppState().password;
    FFAppState().wsMessage = myMessage;
    FFAppState().addToSocketMessageLog(myMessage);
    if (widget.isSecure!) {
      myext = 'wss://';
    }
    myUrl = myext + widget.systemIP! + ':' + widget.systemPort!.toString();

    startStream();
  }

  @override
  void dispose() {
    _channel.sink.close(status.normalClosure);
    super.dispose();
  }

  closeConnect() {
    _channel.sink.close(status.normalClosure);
  }

  doInitMessage(String initMessage) async {
    List<ChannelStruct> cs = functions.parseInit(initMessage!);
    await actions.processInitMessage(
      cs,
    );
  }

  doSysUse(String sysUseMessage) async {
    double su = functions.parseSysUse(sysUseMessage);
    await actions.processSysUse(su);
  }

  sendUserSearch(String u) async {
    _channel.sink.add('[ACCREQ][$u]');
    FFAppState().addToSocketMessageLog('Sent: [ACCREQ][$u]');
    FFAppState().showUserSearch = false;
    FFAppState().sideNavMC = 'account';
  }

  startStream() async {
    myMessage = 'Connecting...';
    FFAppState().wsMessage = myMessage;
    setState(() {});
    _channel = WebSocketChannel.connect(
      Uri.parse(myUrl),
    );

    try {
      await _channel.ready;
      myMessage = 'Authenticating...';
      FFAppState().wsMessage = myMessage;
      FFAppState().addToSocketMessageLog(myMessage);
      setState(() {});
      //FFAppState().connected = true;
    } on WebSocketChannelException catch (e) {
      print('CHANNEL EXCEPTION: ' + e.message!);
    }

    processMessage(String s, String st) {
      if (st == 'AUTHREQ') {
        if (!FFAppState().connected) {
          _channel.sink.add('[AUTHINFO][$myuser][$mypass]');
        }
      } else if (st == 'AUTHOK') {
        FFAppState().connected = true;
      } else if (st == 'AUTHFAIL') {
        FFAppState().connected = false;
        context.goNamed('HomePage');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Authentication Failed',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          ),
        );
      } else if (st == 'CHANNEL') {
        FFAppState().updateChannelLogListAtIndex(
            functions.getChannel(s), (_) => functions.parseChannelLog(s));
      } else if (st == 'AUDIT') {
        FFAppState().addToAuditLogList(functions.parseAuditLog(s));
      } else if (st == 'INIT') {
        doInitMessage(s);
      } else if (st == 'SYSVAR') {
        FFAppState().MySysVars = functions.processSysVar(myMessage);
      } else if (st == 'SYSUSE') {
        doSysUse(s);
      } else if (st == 'ACCDET') {
        FFAppState().currentSearchUser = functions.parseAccDet(s);
      } else {
        FFAppState().wsMessage = 'MESSAGE NOT RECOGNIZED';
      }
    }

    Stream stream = _channel!.stream;

    stream.listen((event) {
      //print(event.toString());
      myMessage = '${event}';
      print(myMessage);
      FFAppState().wsMessage = myMessage;
      FFAppState().addToSocketMessageLog(myMessage);

      myMessage.startsWith('[AUTHREQ')
          ? processMessage(myMessage, 'AUTHREQ')
          : myMessage.startsWith('[AUTHOK')
              ? processMessage(myMessage, 'AUTHOK')
              : myMessage.startsWith('[AUTHFAIL')
                  ? processMessage(myMessage, 'AUTHFAIL')
                  : myMessage.startsWith('[CHANNEL')
                      ? processMessage(myMessage, 'CHANNEL')
                      : myMessage.startsWith('[AUDIT')
                          ? processMessage(myMessage, 'AUDIT')
                          : myMessage.startsWith('[INIT')
                              ? processMessage(myMessage, 'INIT')
                              : myMessage.startsWith('[SYSVAR')
                                  ? processMessage(myMessage, 'SYSVAR')
                                  : myMessage.startsWith('[SYSUSE')
                                      ? processMessage(myMessage, 'SYSUSE')
                                      : myMessage.startsWith('[ACCDET')
                                          ? processMessage(myMessage, 'ACCDET')
                                          : null;

      setState(() {});
    }, onError: (e) {
      print('WEBSOCKET ERROR:  $e');
    }, onDone: () {
      print('WEBSOCKET CLOSED');
      FFAppState().connected = false;
      myMessage = 'Disconnected';
      FFAppState().wsMessage = myMessage;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode textFieldFocusNode = FocusNode();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Generated code for this TextField Widget...
        Visibility(
          visible: FFAppState().showUserSearch,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 100.0, 0.0),
            child: Container(
              width: 400.0,
              child: TextFormField(
                controller: textController,
                focusNode: textFieldFocusNode,
                onFieldSubmitted: (_) async {
                  sendUserSearch(textController.text);
                  safeSetState(() {});
                },
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'User Lookup',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Courier Prime',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Look up a user',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Courier Prime',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: () async {
              if (FFAppState().connected) {
                closeConnect();
                setState(() {});
              } else {
                startStream();
                setState(() {});
              }
            },
            text: FFAppState().connected ? 'Disconnect' : 'Connect',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Courier Prime',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    letterSpacing: 0.0,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        )
      ],
    );
  }
}
