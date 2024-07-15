import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _defaultBG =
          _colorFromIntValue(prefs.getInt('ff_defaultBG')) ?? _defaultBG;
    });
    _safeInit(() {
      _currentBG =
          _colorFromIntValue(prefs.getInt('ff_currentBG')) ?? _currentBG;
    });
    _safeInit(() {
      _systemIP = prefs.getString('ff_systemIP') ?? _systemIP;
    });
    _safeInit(() {
      _systemPort = prefs.getInt('ff_systemPort') ?? _systemPort;
    });
    _safeInit(() {
      _firstLoad = prefs.getBool('ff_firstLoad') ?? _firstLoad;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  Color _currentTxt = Colors.transparent;
  Color get currentTxt => _currentTxt;
  set currentTxt(Color value) {
    _currentTxt = value;
  }

  Color _defaultBG = const Color(0xff2a6af5);
  Color get defaultBG => _defaultBG;
  set defaultBG(Color value) {
    _defaultBG = value;
    prefs.setInt('ff_defaultBG', value.value);
  }

  Color _currentBG = Colors.transparent;
  Color get currentBG => _currentBG;
  set currentBG(Color value) {
    _currentBG = value;
    prefs.setInt('ff_currentBG', value.value);
  }

  Color _defaultTxt = const Color(0xffffffff);
  Color get defaultTxt => _defaultTxt;
  set defaultTxt(Color value) {
    _defaultTxt = value;
  }

  String _systemIP = '';
  String get systemIP => _systemIP;
  set systemIP(String value) {
    _systemIP = value;
    prefs.setString('ff_systemIP', value);
  }

  int _systemPort = 0;
  int get systemPort => _systemPort;
  set systemPort(int value) {
    _systemPort = value;
    prefs.setInt('ff_systemPort', value);
  }

  bool _firstLoad = true;
  bool get firstLoad => _firstLoad;
  set firstLoad(bool value) {
    _firstLoad = value;
    prefs.setBool('ff_firstLoad', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
