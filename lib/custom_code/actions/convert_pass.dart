// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // For utf8 encoding
import 'package:crypto/crypto.dart'; // For sha256

Future<String> convertPass(String pass) async {
  // Add your function code here!

  var bytes = utf8.encode(pass); // Convert the input string to bytes
  var digest = await sha256.convert(bytes); // Get the SHA-256 hash

  return digest.toString();
}
