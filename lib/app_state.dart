import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _version = prefs.getString('ff_version') ?? _version;
    });
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
    _safeInit(() {
      _channelList = prefs
              .getStringList('ff_channelList')
              ?.map((x) {
                try {
                  return ChannelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _channelList;
    });
    _safeInit(() {
      _auditList = prefs
              .getStringList('ff_auditList')
              ?.map((x) {
                try {
                  return AuditStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _auditList;
    });
    _safeInit(() {
      _isSecure = prefs.getBool('ff_isSecure') ?? _isSecure;
    });
    _safeInit(() {
      _wsMessage = prefs.getString('ff_wsMessage') ?? _wsMessage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _version = '0.2.0';
  String get version => _version;
  set version(String value) {
    _version = value;
    prefs.setString('ff_version', value);
  }

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

  int _systemPort = 8881;
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

  List<ChannelStruct> _channelList = [
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"0\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"1\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"2\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"3\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"4\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"5\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"6\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"7\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"8\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"9\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"10\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"11\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"12\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"13\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"14\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"15\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}'))
  ];
  List<ChannelStruct> get channelList => _channelList;
  set channelList(List<ChannelStruct> value) {
    _channelList = value;
    prefs.setStringList(
        'ff_channelList', value.map((x) => x.serialize()).toList());
  }

  void addToChannelList(ChannelStruct value) {
    channelList.add(value);
    prefs.setStringList(
        'ff_channelList', _channelList.map((x) => x.serialize()).toList());
  }

  void removeFromChannelList(ChannelStruct value) {
    channelList.remove(value);
    prefs.setStringList(
        'ff_channelList', _channelList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromChannelList(int index) {
    channelList.removeAt(index);
    prefs.setStringList(
        'ff_channelList', _channelList.map((x) => x.serialize()).toList());
  }

  void updateChannelListAtIndex(
    int index,
    ChannelStruct Function(ChannelStruct) updateFn,
  ) {
    channelList[index] = updateFn(_channelList[index]);
    prefs.setStringList(
        'ff_channelList', _channelList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInChannelList(int index, ChannelStruct value) {
    channelList.insert(index, value);
    prefs.setStringList(
        'ff_channelList', _channelList.map((x) => x.serialize()).toList());
  }

  List<AuditStruct> _auditList = [];
  List<AuditStruct> get auditList => _auditList;
  set auditList(List<AuditStruct> value) {
    _auditList = value;
    prefs.setStringList(
        'ff_auditList', value.map((x) => x.serialize()).toList());
  }

  void addToAuditList(AuditStruct value) {
    auditList.add(value);
    prefs.setStringList(
        'ff_auditList', _auditList.map((x) => x.serialize()).toList());
  }

  void removeFromAuditList(AuditStruct value) {
    auditList.remove(value);
    prefs.setStringList(
        'ff_auditList', _auditList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAuditList(int index) {
    auditList.removeAt(index);
    prefs.setStringList(
        'ff_auditList', _auditList.map((x) => x.serialize()).toList());
  }

  void updateAuditListAtIndex(
    int index,
    AuditStruct Function(AuditStruct) updateFn,
  ) {
    auditList[index] = updateFn(_auditList[index]);
    prefs.setStringList(
        'ff_auditList', _auditList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAuditList(int index, AuditStruct value) {
    auditList.insert(index, value);
    prefs.setStringList(
        'ff_auditList', _auditList.map((x) => x.serialize()).toList());
  }

  bool _isSecure = false;
  bool get isSecure => _isSecure;
  set isSecure(bool value) {
    _isSecure = value;
    prefs.setBool('ff_isSecure', value);
  }

  String _wsMessage = '';
  String get wsMessage => _wsMessage;
  set wsMessage(String value) {
    _wsMessage = value;
    prefs.setString('ff_wsMessage', value);
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
