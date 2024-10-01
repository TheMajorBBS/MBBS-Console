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
  int? character = int.parse(matches.elementAt(3).group(1)!);
  String? code = matches.elementAt(4).group(1);

  if (code == 'a') {
    msg = 'TCP/IP channel ready...';
  }
  if (msg!.startsWith('TCP/IP channel ready')) {
    msg = 'TCP/IP channel ready...';
  }

  return ChannelStruct(
      msg: msg!,
      character: character,
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
  RegExp regExp = RegExp(r'\[(.*?)\]');

  // Find all matches
  Iterable<RegExpMatch> matches = regExp.allMatches(initString!);
  List<ChannelStruct> initMatches = [];

  // Iterate over matches and print the groups
  for (var match in matches) {
    String matchData = match.group(1)!;
    String hex = '';
    String char = '';
    String mymsg = '';
    if (matchData.contains(':')) {
      List<String> splitData = matchData.split(':');
      hex = splitData[0];
      char = splitData[1];
      if (char == '45') {
        mymsg = 'Local Session';
      } else {
        mymsg = 'TCP/IP channel ready...';
      }

      initMatches.add(ChannelStruct(
          msg: mymsg,
          character: int.parse(char),
          code: 0,
          channel: int.parse(hex, radix: 16)));
    }
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
  String mymsg = '';
  for (count = 0; count <= 255; count++) {
    if (count == 0) {
      mymsg = "Local Session";
    } else {
      mymsg = "TCP/IP channel ready...";
    }
    channelList.add(ChannelStruct(
      msg: mymsg,
      character: 254,
      code: 0,
      channel: count,
    ));
  }

  return channelList!;
}

String? returnCharacter(int? charCode) {
  int? newCode;

  if (charCode == 18) {
    newCode = 8597;
  } else if (charCode == 254) {
    newCode = 9632;
  } else if (charCode == 15) {
    newCode = 9788;
  } else if (charCode == 9) {
    newCode = 927;
  } else if (charCode == 21) {
    newCode = 8869;
  } else if (charCode == 50616) {
    newCode = 402;
  } else if (charCode == 24) {
    newCode = 8593;
  } else {
    newCode = charCode!;
  }

  return String.fromCharCode(newCode!);
}

SysVarsStruct processSysVar(String myMessage) {
  RegExp regExp = RegExp(r'\[(.*?)\]');
  Iterable<Match> matches = regExp.allMatches(myMessage!);
  String MEM = '';
  String HDDS = '';
  String RESPT = '';
  int ACTACC = 0;
  int CALLS = 0;
  int MSGTOT = 0;

  for (var match in matches) {
    String content = match.group(1)!; // Extract content inside []

    // Check if it contains a colon
    if (content.contains(':')) {
      List<String> parts = content.split(':');
      String key = parts[0].trim(); // Key before the colon
      String value = parts[1].trim(); // Value after the colon
      if (key == 'MEM') {
        MEM = value;
      } else if (key == 'HDDS') {
        HDDS = value;
      } else if (key == 'RESPT') {
        RESPT = value;
      } else if (key == 'ACTACC') {
        ACTACC = int.parse(value);
      } else if (key == 'CALLS') {
        CALLS = int.parse(value);
      } else if (key == 'MSGTOT') {
        MSGTOT = int.parse(value);
      } else {
        print('NO VALUE');
      }
    }
  }
  return SysVarsStruct(
    hdd: HDDS,
    response: RESPT,
    memory: MEM,
    acctAct: ACTACC,
    calls: CALLS,
    msgtot: MSGTOT,
    time: DateTime.now(),
  );
}

String chanToHex(int channelInt) {
  final myInt = channelInt;
  final newHex = myInt.toRadixString(16);
  final padHex = newHex.padLeft(2, '0');
  return padHex.toUpperCase();
}

double parseSysUse(String sysString) {
  RegExp regExp = RegExp(r'\[(.*?)\]');
  Iterable<RegExpMatch> matches = regExp.allMatches(sysString);
  double myuse = 0.0;

  for (var match in matches) {
    String content = match.group(1)!; // Extract content inside the brackets
    if (content.contains(':')) {
      // If content contains ':', split it
      List<String> parts = content.split(':');
      String key = parts[0];
      String value = parts[1];
      myuse = double.parse(value);
    }
  }
  return myuse;
}

UserRecordStruct parseAccDet(String accDetString) {
  RegExp regExp = RegExp(r'\[([A-Z0-9]+):([^\]]*)\]');
  Map<String, String> parsedData = {};
  String name = '';
  String addr1 = '';
  String addr2 = '';
  String addr3 = '';
  String addr4 = '';
  String phone = '';
  DateTime born = DateTime.now();
  String sex = '';
  String defaultEditor = '';
  String system = '';
  String screen = '';
  String screen2 = '';
  String screen3 = '';
  String userClass = '';
  String passwd = '*********';
  int creditAvail = 0;
  int creditTotal = 0;
  int creditsPaid = 0;
  String hasMaster = '';
  String suspended = '';
  String tagForKill = '';
  String protected = '';
  String username = '';
  DateTime acctCreated = DateTime.now();
  DateTime lastCall = DateTime.now();
  double dayUsage = 0.0;

  processKey(String s, String v) {
    if (s == 'NAME') {
      name = v;
    } else if (s == 'ADD1') {
      addr1 = v;
    } else if (s == 'ADD2') {
      addr2 = v;
    } else if (s == 'ADD3') {
      addr3 = v;
    } else if (s == 'ADD4') {
      addr4 = v;
    } else if (s == 'PHONE') {
      phone = v;
    } else if (s == 'USRID') {
      username = v;
    } else if (s == 'DOB') {
      int? year = int.parse(v!.substring(0, 4));
      int? month = int.parse(v.substring(4, 6));
      int? day = int.parse(v.substring(6, 8));
      DateTime timestamp = DateTime(year, month, day);
      born = timestamp;
    } else if (s == 'DEFEDT') {
      if (v == '0') {
        defaultEditor = 'FSE';
      } else {
        defaultEditor = 'LINE';
      }
    } else if (s == 'SYSTYP') {
      if (v == '0') {
        system = 'OTHER';
      } else if (v == 1) {
        system = 'IBM-PC';
      } else if (v == 2) {
        system = 'Macintosh';
      } else {
        system = 'Apple/non-Mac';
      }
    } else if (s == 'SCNWID') {
      screen = v + ' x';
    } else if (s == 'SCNLEN') {
      screen2 = v;
    } else if (s == 'CLASS') {
      userClass = v;
    } else if (s == 'CREDAVL') {
      creditAvail = int.parse(v);
    } else if (s == 'CREDTOT') {
      creditTotal = int.parse(v);
    } else if (s == 'CREDPAID') {
      creditsPaid = int.parse(v);
    } else if (s == 'ACCCRE') {
      List<String> dateParts = v.split('/');
      int month = int.parse(dateParts[0]);
      int day = int.parse(dateParts[1]);
      int year = int.parse(dateParts[2]);
      acctCreated = DateTime(year, month, day);
    } else if (s == 'LASTUSE') {
      List<String> dateParts = v.split('/');
      int month = int.parse(dateParts[0]);
      int day = int.parse(dateParts[1]);
      int year = int.parse(dateParts[2]);
      lastCall = DateTime(year, month, day);
    } else if (s == 'USEDTOD') {
      dayUsage = double.parse(v);
    } else if (s == 'MASTER') {
      if (v == '0') {
        hasMaster = 'NO';
      } else {
        hasMaster = 'YES';
      }
    } else if (s == 'SUSP') {
      if (v == '0') {
        suspended = 'NO';
      } else {
        suspended = 'YES';
      }
    } else if (s == 'TAGKILL') {
      if (v == '0') {
        tagForKill = 'NO';
      } else {
        tagForKill = 'YES';
      }
    } else if (s == 'PROT') {
      if (v == '0') {
        protected = 'NO';
      } else {
        protected = 'YES';
      }
    }
  }

  Iterable<RegExpMatch> matches = regExp.allMatches(accDetString);

  for (var match in matches) {
    String key = match.group(1) ?? '';
    String value = match.group(2) ?? '';
    processKey(key, value);
  }
  return UserRecordStruct(
    name: name,
    addr1: addr1,
    addr2: addr2,
    addr3: addr3,
    addr4: addr4,
    phone: phone,
    born: born,
    sex: sex,
    defaultEditor: defaultEditor,
    system: system,
    screen: screen,
    screen2: screen2,
    screen3: screen3,
    userClass: userClass,
    passwd: '*********',
    creditAvail: creditAvail,
    creditTotal: creditTotal,
    creditsPaid: creditsPaid,
    hasMaster: hasMaster,
    suspended: suspended,
    tagForKill: tagForKill,
    protected: protected,
    username: username,
    acctCreated: acctCreated,
    lastCall: lastCall,
    dayUsage: dayUsage,
  );
}
