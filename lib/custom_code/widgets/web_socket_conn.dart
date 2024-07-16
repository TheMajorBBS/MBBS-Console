// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketConn extends StatefulWidget {
  const WebSocketConn({
    super.key,
    this.width,
    this.height,
    this.systemIP,
    this.systemPort,
  });

  final double? width;
  final double? height;
  final String? systemIP;
  final int? systemPort;

  @override
  State<WebSocketConn> createState() => _WebSocketConnState();
}

class _WebSocketConnState extends State<WebSocketConn> {
  String myUrl = '';
  String myMessage = '';

  @override
  void initState() {
    super.initState();
    myUrl = 'ws://' + widget.systemIP + ':' + widget.systemPort.toString();

    final _channel = WebSocketChannel.connect(
      Uri.parse(myUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            FFFAppState().insertAtIndexInChannelList(
                0,
                ChannelStruct(
                  msg: 'Local Session',
                  character: '-',
                  code: 23,
                  channel: 0,
                ));
            FFAppState().addToAuditList(AuditStruct(
              datetime: getCurrentTimestamp,
              data: 'This is my audit',
            ));
            setState(() {});
            return Text('${snapshot.data}');
          }
        });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
