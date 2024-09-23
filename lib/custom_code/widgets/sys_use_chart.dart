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

import 'package:fl_chart/fl_chart.dart';

class SysUseChart extends StatefulWidget {
  const SysUseChart({
    super.key,
    this.width,
    this.height,
    this.xvalue,
    this.yvalue,
  });

  final double? width;
  final double? height;
  final List<double>? xvalue;
  final List<double>? yvalue;

  @override
  State<SysUseChart> createState() => _SysUseChartState();
}

class _SysUseChartState extends State<SysUseChart> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
