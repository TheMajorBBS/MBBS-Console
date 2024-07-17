// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuditStruct extends BaseStruct {
  AuditStruct({
    DateTime? datetime,
    String? data,
    String? channel,
    String? user,
  })  : _datetime = datetime,
        _data = data,
        _channel = channel,
        _user = user;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  set datetime(DateTime? val) => _datetime = val;

  bool hasDatetime() => _datetime != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  set channel(String? val) => _channel = val;

  bool hasChannel() => _channel != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  set user(String? val) => _user = val;

  bool hasUser() => _user != null;

  static AuditStruct fromMap(Map<String, dynamic> data) => AuditStruct(
        datetime: data['datetime'] as DateTime?,
        data: data['data'] as String?,
        channel: data['channel'] as String?,
        user: data['user'] as String?,
      );

  static AuditStruct? maybeFromMap(dynamic data) =>
      data is Map ? AuditStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'datetime': _datetime,
        'data': _data,
        'channel': _channel,
        'user': _user,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'datetime': serializeParam(
          _datetime,
          ParamType.DateTime,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'channel': serializeParam(
          _channel,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuditStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuditStruct(
        datetime: deserializeParam(
          data['datetime'],
          ParamType.DateTime,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        channel: deserializeParam(
          data['channel'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuditStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuditStruct &&
        datetime == other.datetime &&
        data == other.data &&
        channel == other.channel &&
        user == other.user;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([datetime, data, channel, user]);
}

AuditStruct createAuditStruct({
  DateTime? datetime,
  String? data,
  String? channel,
  String? user,
}) =>
    AuditStruct(
      datetime: datetime,
      data: data,
      channel: channel,
      user: user,
    );
