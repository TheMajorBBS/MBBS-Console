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
      _isSecure = prefs.getBool('ff_isSecure') ?? _isSecure;
    });
    _safeInit(() {
      _wsMessage = prefs.getString('ff_wsMessage') ?? _wsMessage;
    });
    _safeInit(() {
      _setChannelList = prefs
              .getStringList('ff_setChannelList')
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
          _setChannelList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _version = '0.2.8';
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

  List<ChannelStruct> _channelLogList = [];
  List<ChannelStruct> get channelLogList => _channelLogList;
  set channelLogList(List<ChannelStruct> value) {
    _channelLogList = value;
  }

  void addToChannelLogList(ChannelStruct value) {
    channelLogList.add(value);
  }

  void removeFromChannelLogList(ChannelStruct value) {
    channelLogList.remove(value);
  }

  void removeAtIndexFromChannelLogList(int index) {
    channelLogList.removeAt(index);
  }

  void updateChannelLogListAtIndex(
    int index,
    ChannelStruct Function(ChannelStruct) updateFn,
  ) {
    channelLogList[index] = updateFn(_channelLogList[index]);
  }

  void insertAtIndexInChannelLogList(int index, ChannelStruct value) {
    channelLogList.insert(index, value);
  }

  List<AuditStruct> _auditLogList = [];
  List<AuditStruct> get auditLogList => _auditLogList;
  set auditLogList(List<AuditStruct> value) {
    _auditLogList = value;
  }

  void addToAuditLogList(AuditStruct value) {
    auditLogList.add(value);
  }

  void removeFromAuditLogList(AuditStruct value) {
    auditLogList.remove(value);
  }

  void removeAtIndexFromAuditLogList(int index) {
    auditLogList.removeAt(index);
  }

  void updateAuditLogListAtIndex(
    int index,
    AuditStruct Function(AuditStruct) updateFn,
  ) {
    auditLogList[index] = updateFn(_auditLogList[index]);
  }

  void insertAtIndexInAuditLogList(int index, AuditStruct value) {
    auditLogList.insert(index, value);
  }

  List<ChannelStruct> _setChannelList = [
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"0\",\"msg\":\"Local Session\",\"character\":\"-\",\"code\":\"0\"}')),
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
        '{\"channel\":\"14\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}'))
  ];
  List<ChannelStruct> get setChannelList => _setChannelList;
  set setChannelList(List<ChannelStruct> value) {
    _setChannelList = value;
    prefs.setStringList(
        'ff_setChannelList', value.map((x) => x.serialize()).toList());
  }

  void addToSetChannelList(ChannelStruct value) {
    setChannelList.add(value);
    prefs.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void removeFromSetChannelList(ChannelStruct value) {
    setChannelList.remove(value);
    prefs.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSetChannelList(int index) {
    setChannelList.removeAt(index);
    prefs.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void updateSetChannelListAtIndex(
    int index,
    ChannelStruct Function(ChannelStruct) updateFn,
  ) {
    setChannelList[index] = updateFn(_setChannelList[index]);
    prefs.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSetChannelList(int index, ChannelStruct value) {
    setChannelList.insert(index, value);
    prefs.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  bool _connected = false;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
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
