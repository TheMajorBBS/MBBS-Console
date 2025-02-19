import 'package:platform_detect/platform_detect.dart';
import 'dart:html' as html;

bool get isMacOs => operatingSystem.isMac;
String getUserAgent() => html.window.navigator.userAgent.toLowerCase();
