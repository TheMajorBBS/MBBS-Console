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
  late WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();
    myMessage = 'Connecting...';
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

  startStream() async {
    myMessage = 'Connecting...';
    FFAppState().wsMessage = myMessage;
    setState(() {});
    _channel = WebSocketChannel.connect(
      Uri.parse(myUrl),
    );

    try {
      await _channel.ready;
      FFAppState().connected = true;
    } on WebSocketChannelException catch (e) {
      print('CHANNEL EXCEPTION: ' + e.message!);
    }

    Stream stream = _channel!.stream;

    stream.listen((event) {
      //print(event.toString());
      myMessage = '${event}';
      print(myMessage);
      FFAppState().wsMessage = myMessage;
      myMessage.startsWith('[CHANNEL')
          ? FFAppState().updateChannelLogListAtIndex(
              functions.getChannel(myMessage!)!,
              (_) => functions.parseChannelLog(myMessage!),
            )
          : myMessage.startsWith('[AUDIT')
              ? FFAppState()
                  .addToAuditLogList(functions.parseAuditLog(myMessage!))
              : myMessage.startsWith('[INIT')
                  ? () async {
                      List<ChannelStruct> cs =
                          await functions.parseInit(myMessage!);
                      await actions.processInitMessage(
                        cs,
                      );
                    }()
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
        Text(FFAppState().wsMessage,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Courier Prime',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 18,
                  letterSpacing: 0,
                )),
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
