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

  @override
  void initState() {
    super.initState();
    myMessage = 'Connecting...';
    myuser = FFAppState().username;
    mypass = FFAppState().password;
    FFAppState().wsMessage = myMessage;
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
    return Column(
      children: [
        Column(
          children: [
            Text(FFAppState().wsMessage,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Courier Prime',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 18,
                      letterSpacing: 0,
                    ))
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
