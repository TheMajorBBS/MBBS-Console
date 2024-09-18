import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

AuditStruct parseAuditLog(String auditString) {
  final regex = RegExp(r'\[([^\]]+)\]');
  final matches = regex.allMatches(auditString!);

  if (matches.length != 5) {
    throw FormatException('Unexpected log format');
  }

  final type = matches.elementAt(0).group(1);
  final timestampStr = matches.elementAt(1).group(1);
  final action = matches.elementAt(2).group(1);
  final channel = matches.elementAt(3).group(1);
  final userId = matches.elementAt(4).group(1);

  int? year = int.parse(timestampStr!.substring(0, 4));
  int? month = int.parse(timestampStr.substring(4, 6));
  int? day = int.parse(timestampStr.substring(6, 8));
  int? hour = int.parse(timestampStr.substring(9, 11));
  int? minute = int.parse(timestampStr.substring(11, 13));
  int? second = int.parse(timestampStr.substring(13, 15));

  // Creating DateTime object
  DateTime timestamp = DateTime(year, month, day, hour, minute, second);

  return AuditStruct(
      datetime: timestamp, data: action!, channel: channel!, user: userId!);
}

ChannelStruct parseChannelLog(String channelString) {
  final regex = RegExp(r'\[([^\]]+)\]');
  final matches = regex.allMatches(channelString!);

  if (matches.length != 5) {
    throw FormatException('Unexpected log format');
  }

  String? type = matches.elementAt(0).group(1);
  String? channel = matches.elementAt(1).group(1);
  String? msg = matches.elementAt(2).group(1);
  String? character = matches.elementAt(3).group(1);
  String? code = matches.elementAt(4).group(1);

  if (code == 'a') {
    msg = 'idle';
  }
  if (msg!.startsWith('TCP/IP channel ready')) {
    msg = 'idle';
  }

  return ChannelStruct(
      msg: msg!,
      character: character!,
      code: int.parse(code!),
      channel: int.parse(channel!, radix: 16));
}

int getChannel(String channelString) {
  final regex = RegExp(r'\[([^\]]+)\]');
  final matches = regex.allMatches(channelString!);

  if (matches.length != 5) {
    throw FormatException('Unexpected log format');
  }

  final type = matches.elementAt(0).group(1);
  final channel = matches.elementAt(1).group(1);
  final msg = matches.elementAt(2).group(1);
  final character = matches.elementAt(3).group(1);
  final code = matches.elementAt(4).group(1);
  final channelConvert = int.parse(channel!, radix: 16);
  print('RECEIVED CHANNEL: ' + channel!);
  print('CONVERTED CHANNEL: ' + channelConvert!.toString());

  return channelConvert;
}

List<ChannelStruct> parseInit(String? initString) {
  RegExp regExp = RegExp(r'\[([0-9A-F]{2}) (.)\]');

  // Find all matches
  Iterable<RegExpMatch> matches = regExp.allMatches(initString!);
  List<ChannelStruct> initMatches = [];
  int maxChannels = 16;
  int counter = 0;

  // Iterate over matches and print the groups
  for (var match in matches) {
    if (counter < matches.length) {
      String hex = match.group(1)!;
      String value = match.group(2)!;
      String nmsg = '';
      if (value == '.' && hex != '00') {
        nmsg = 'idle';
      } else if (hex == '00') {
        nmsg = 'Local Session';
      } else {
        nmsg = value;
      }

      initMatches.add(ChannelStruct(
          msg: nmsg,
          character: value,
          code: 0,
          channel: int.parse(hex, radix: 16)));
    }
    counter++;
  }
  //print('INIT: ' + initMatches.toString());
  return initMatches;
}

int? convertChannel(String? baseChannel) {
  return int.parse(baseChannel!, radix: 16);
}

List<ChannelStruct> initialChannelList() {
  List<ChannelStruct> channelList = [];
  int count = 0;
  for (count = 0; count <= 255; count++) {
    channelList.add(ChannelStruct(
      msg: "init",
      character: "▪",
      code: 0,
      channel: count,
    ));
  }

  return channelList!;
}
