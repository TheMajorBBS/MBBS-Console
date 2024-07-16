// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuditStruct extends BaseStruct {
  AuditStruct({
    DateTime? datetime,
    String? data,
  })  : _datetime = datetime,
        _data = data;

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

  static AuditStruct fromMap(Map<String, dynamic> data) => AuditStruct(
        datetime: data['datetime'] as DateTime?,
        data: data['data'] as String?,
      );

  static AuditStruct? maybeFromMap(dynamic data) =>
      data is Map ? AuditStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'datetime': _datetime,
        'data': _data,
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
      );

  @override
  String toString() => 'AuditStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuditStruct &&
        datetime == other.datetime &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([datetime, data]);
}

AuditStruct createAuditStruct({
  DateTime? datetime,
  String? data,
}) =>
    AuditStruct(
      datetime: datetime,
      data: data,
    );
