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

AuditStruct? parseAuditLog(String? auditString) {
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

  final dateFormat = DateFormat('yyyyMMdd HHmmss');
  final timestamp = dateFormat.parse(timestampStr!);
  return AuditStruct(
      datetime: timestamp, data: action!, channel: channel!, user: userId!);
}

ChannelStruct? parseChannelLog(String? channelString) {
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

  return ChannelStruct(
      msg: msg!,
      character: character!,
      code: int.parse(code!),
      channel: int.parse(channel!));
}
