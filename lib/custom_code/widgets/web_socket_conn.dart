// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
  String myMessage = '';
  WebSocketChannel? _channel;

  @override
  void initState() {
    super.initState();
    if (isSecure) {
      myext = 'wss://';
    }
    myUrl = myext + widget.systemIP! + ':' + widget.systemPort!.toString();

    _channel = WebSocketChannel.connect(
      Uri.parse(myUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _channel!.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            myMessage = '${snapshot.data}';
            myMessage.startsWith('[CHANNEL')
                ? FFAppState().insertAtIndexInChannelList(
                    functions.getChannel(myMessage!)!,
                    functions.parseChannelLog(myMessage!))
                : myMessage.startsWith('[Audit')
                    ? FFAppState()
                        .addToAuditList(functions.parseAuditLog(myMessage!))
                    : null;
            setState(() {});
            return Text(myMessage);
          } else {
            return Text(myMessage);
          }
        });
  }

  @override
  void dispose() {
    _channel!.sink.close();
    super.dispose();
  }
}
