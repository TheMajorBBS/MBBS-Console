// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future processSysUse(double usage) async {
  // Add your function code here!
  double myuse = 0.0;
  myuse = usage;
  DateTime now = DateTime.now();
  int myminute = now.minute;
  if (myminute > 0 && myminute < 15) {
    FFAppState().updateUseyAtIndex(
      0,
      (_) => myuse,
    );
  } else if (myminute >= 15 && myminute < 30) {
    FFAppState().updateUseyAtIndex(
      1,
      (_) => myuse,
    );
  } else if (myminute >= 30 && myminute < 45) {
    FFAppState().updateUseyAtIndex(
      2,
      (_) => myuse,
    );
  } else if (myminute >= 45 && myminute <= 59) {
    FFAppState().updateUseyAtIndex(
      3,
      (_) => myuse,
    );
  } else {
    print('NO USE VALUE');
  }
}
