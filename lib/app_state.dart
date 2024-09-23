import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _version = await secureStorage.getString('ff_version') ?? _version;
    });
    await _safeInitAsync(() async {
      _currentTxt =
          _colorFromIntValue(await secureStorage.getInt('ff_currentTxt')) ??
              _currentTxt;
    });
    await _safeInitAsync(() async {
      _defaultBG =
          _colorFromIntValue(await secureStorage.getInt('ff_defaultBG')) ??
              _defaultBG;
    });
    await _safeInitAsync(() async {
      _currentBG =
          _colorFromIntValue(await secureStorage.getInt('ff_currentBG')) ??
              _currentBG;
    });
    await _safeInitAsync(() async {
      _defaultTxt =
          _colorFromIntValue(await secureStorage.getInt('ff_defaultTxt')) ??
              _defaultTxt;
    });
    await _safeInitAsync(() async {
      _systemIP = await secureStorage.getString('ff_systemIP') ?? _systemIP;
    });
    await _safeInitAsync(() async {
      _systemPort = await secureStorage.getInt('ff_systemPort') ?? _systemPort;
    });
    await _safeInitAsync(() async {
      _firstLoad = await secureStorage.getBool('ff_firstLoad') ?? _firstLoad;
    });
    await _safeInitAsync(() async {
      _isSecure = await secureStorage.getBool('ff_isSecure') ?? _isSecure;
    });
    await _safeInitAsync(() async {
      _wsMessage = await secureStorage.getString('ff_wsMessage') ?? _wsMessage;
    });
    await _safeInitAsync(() async {
      _setChannelList = (await secureStorage.getStringList('ff_setChannelList'))
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
    await _safeInitAsync(() async {
      _username = await secureStorage.getString('ff_username') ?? _username;
    });
    await _safeInitAsync(() async {
      _password = await secureStorage.getString('ff_password') ?? _password;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_MySysVars') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_MySysVars') ?? '{}';
          _MySysVars =
              SysVarsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _version = '0.7.0';
  String get version => _version;
  set version(String value) {
    _version = value;
    secureStorage.setString('ff_version', value);
  }

  void deleteVersion() {
    secureStorage.delete(key: 'ff_version');
  }

  Color _currentTxt = Colors.transparent;
  Color get currentTxt => _currentTxt;
  set currentTxt(Color value) {
    _currentTxt = value;
    secureStorage.setInt('ff_currentTxt', value.value);
  }

  void deleteCurrentTxt() {
    secureStorage.delete(key: 'ff_currentTxt');
  }

  Color _defaultBG = const Color(0xff0000ab);
  Color get defaultBG => _defaultBG;
  set defaultBG(Color value) {
    _defaultBG = value;
    secureStorage.setInt('ff_defaultBG', value.value);
  }

  void deleteDefaultBG() {
    secureStorage.delete(key: 'ff_defaultBG');
  }

  Color _currentBG = Colors.transparent;
  Color get currentBG => _currentBG;
  set currentBG(Color value) {
    _currentBG = value;
    secureStorage.setInt('ff_currentBG', value.value);
  }

  void deleteCurrentBG() {
    secureStorage.delete(key: 'ff_currentBG');
  }

  Color _defaultTxt = const Color(0xffffffff);
  Color get defaultTxt => _defaultTxt;
  set defaultTxt(Color value) {
    _defaultTxt = value;
    secureStorage.setInt('ff_defaultTxt', value.value);
  }

  void deleteDefaultTxt() {
    secureStorage.delete(key: 'ff_defaultTxt');
  }

  String _systemIP = '';
  String get systemIP => _systemIP;
  set systemIP(String value) {
    _systemIP = value;
    secureStorage.setString('ff_systemIP', value);
  }

  void deleteSystemIP() {
    secureStorage.delete(key: 'ff_systemIP');
  }

  int _systemPort = 8881;
  int get systemPort => _systemPort;
  set systemPort(int value) {
    _systemPort = value;
    secureStorage.setInt('ff_systemPort', value);
  }

  void deleteSystemPort() {
    secureStorage.delete(key: 'ff_systemPort');
  }

  bool _firstLoad = true;
  bool get firstLoad => _firstLoad;
  set firstLoad(bool value) {
    _firstLoad = value;
    secureStorage.setBool('ff_firstLoad', value);
  }

  void deleteFirstLoad() {
    secureStorage.delete(key: 'ff_firstLoad');
  }

  bool _isSecure = false;
  bool get isSecure => _isSecure;
  set isSecure(bool value) {
    _isSecure = value;
    secureStorage.setBool('ff_isSecure', value);
  }

  void deleteIsSecure() {
    secureStorage.delete(key: 'ff_isSecure');
  }

  String _wsMessage = 'connecting...';
  String get wsMessage => _wsMessage;
  set wsMessage(String value) {
    _wsMessage = value;
    secureStorage.setString('ff_wsMessage', value);
  }

  void deleteWsMessage() {
    secureStorage.delete(key: 'ff_wsMessage');
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
        '{\"channel\":\"14\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}')),
    ChannelStruct.fromSerializableMap(jsonDecode(
        '{\"channel\":\"15\",\"msg\":\"idle\",\"character\":\"-\",\"code\":\"0\"}'))
  ];
  List<ChannelStruct> get setChannelList => _setChannelList;
  set setChannelList(List<ChannelStruct> value) {
    _setChannelList = value;
    secureStorage.setStringList(
        'ff_setChannelList', value.map((x) => x.serialize()).toList());
  }

  void deleteSetChannelList() {
    secureStorage.delete(key: 'ff_setChannelList');
  }

  void addToSetChannelList(ChannelStruct value) {
    setChannelList.add(value);
    secureStorage.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void removeFromSetChannelList(ChannelStruct value) {
    setChannelList.remove(value);
    secureStorage.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSetChannelList(int index) {
    setChannelList.removeAt(index);
    secureStorage.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void updateSetChannelListAtIndex(
    int index,
    ChannelStruct Function(ChannelStruct) updateFn,
  ) {
    setChannelList[index] = updateFn(_setChannelList[index]);
    secureStorage.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSetChannelList(int index, ChannelStruct value) {
    setChannelList.insert(index, value);
    secureStorage.setStringList('ff_setChannelList',
        _setChannelList.map((x) => x.serialize()).toList());
  }

  bool _connected = false;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
    secureStorage.setString('ff_username', value);
  }

  void deleteUsername() {
    secureStorage.delete(key: 'ff_username');
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    secureStorage.setString('ff_password', value);
  }

  void deletePassword() {
    secureStorage.delete(key: 'ff_password');
  }

  SysVarsStruct _MySysVars = SysVarsStruct();
  SysVarsStruct get MySysVars => _MySysVars;
  set MySysVars(SysVarsStruct value) {
    _MySysVars = value;
    secureStorage.setString('ff_MySysVars', value.serialize());
  }

  void deleteMySysVars() {
    secureStorage.delete(key: 'ff_MySysVars');
  }

  void updateMySysVarsStruct(Function(SysVarsStruct) updateFn) {
    updateFn(_MySysVars);
    secureStorage.setString('ff_MySysVars', _MySysVars.serialize());
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
