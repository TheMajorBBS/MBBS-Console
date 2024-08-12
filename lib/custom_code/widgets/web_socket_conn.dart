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

import 'package:web_socket_channel/web_socket_channel.dart';
import '/flutter_flow/custom_functions.dart' as functions;

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
  WebSocketChannel? _channel;

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
    _channel!.sink.close();
    super.dispose();
  }

  closeConnect() {
    _channel!.sink.close();
    FFAppState().connected = false;
  }

  startStream() async {
    _channel = WebSocketChannel.connect(
      Uri.parse(myUrl),
    );

    try {
      await _channel!.ready;
      FFAppState().connected = true;
    } on WebSocketChannelException catch (e) {
      print('CHANNEL EXCEPTION: $e');
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
              : null;
      setState(() {});
    }, onError: (e) {
      print('WEBSCOKET ERROR:  $e');
    }, onDone: () {
      print('WEBSCOKET CLOSED');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(FFAppState().wsMessage,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Courier Prime',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 18,
              letterSpacing: 0,
            ));
  }
}
