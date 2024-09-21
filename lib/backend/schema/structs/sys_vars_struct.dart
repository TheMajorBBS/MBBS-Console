// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SysVarsStruct extends BaseStruct {
  SysVarsStruct({
    String? hdd,
    String? response,
    String? memory,
    int? acctAct,
    int? calls,
    int? msgtot,
    DateTime? time,
  })  : _hdd = hdd,
        _response = response,
        _memory = memory,
        _acctAct = acctAct,
        _calls = calls,
        _msgtot = msgtot,
        _time = time;

  // "HDD" field.
  String? _hdd;
  String get hdd => _hdd ?? '76 GBB';
  set hdd(String? val) => _hdd = val;

  bool hasHdd() => _hdd != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '6 ms';
  set response(String? val) => _response = val;

  bool hasResponse() => _response != null;

  // "memory" field.
  String? _memory;
  String get memory => _memory ?? '1 GB';
  set memory(String? val) => _memory = val;

  bool hasMemory() => _memory != null;

  // "AcctAct" field.
  int? _acctAct;
  int get acctAct => _acctAct ?? 9;
  set acctAct(int? val) => _acctAct = val;

  void incrementAcctAct(int amount) => acctAct = acctAct + amount;

  bool hasAcctAct() => _acctAct != null;

  // "calls" field.
  int? _calls;
  int get calls => _calls ?? 5;
  set calls(int? val) => _calls = val;

  void incrementCalls(int amount) => calls = calls + amount;

  bool hasCalls() => _calls != null;

  // "msgtot" field.
  int? _msgtot;
  int get msgtot => _msgtot ?? 5;
  set msgtot(int? val) => _msgtot = val;

  void incrementMsgtot(int amount) => msgtot = msgtot + amount;

  bool hasMsgtot() => _msgtot != null;

  // "time" field.
  DateTime? _time;
  DateTime get time =>
      _time ?? DateTime.fromMicrosecondsSinceEpoch(1726804800000000);
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  static SysVarsStruct fromMap(Map<String, dynamic> data) => SysVarsStruct(
        hdd: data['HDD'] as String?,
        response: data['response'] as String?,
        memory: data['memory'] as String?,
        acctAct: castToType<int>(data['AcctAct']),
        calls: castToType<int>(data['calls']),
        msgtot: castToType<int>(data['msgtot']),
        time: data['time'] as DateTime?,
      );

  static SysVarsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SysVarsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'HDD': _hdd,
        'response': _response,
        'memory': _memory,
        'AcctAct': _acctAct,
        'calls': _calls,
        'msgtot': _msgtot,
        'time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'HDD': serializeParam(
          _hdd,
          ParamType.String,
        ),
        'response': serializeParam(
          _response,
          ParamType.String,
        ),
        'memory': serializeParam(
          _memory,
          ParamType.String,
        ),
        'AcctAct': serializeParam(
          _acctAct,
          ParamType.int,
        ),
        'calls': serializeParam(
          _calls,
          ParamType.int,
        ),
        'msgtot': serializeParam(
          _msgtot,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SysVarsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SysVarsStruct(
        hdd: deserializeParam(
          data['HDD'],
          ParamType.String,
          false,
        ),
        response: deserializeParam(
          data['response'],
          ParamType.String,
          false,
        ),
        memory: deserializeParam(
          data['memory'],
          ParamType.String,
          false,
        ),
        acctAct: deserializeParam(
          data['AcctAct'],
          ParamType.int,
          false,
        ),
        calls: deserializeParam(
          data['calls'],
          ParamType.int,
          false,
        ),
        msgtot: deserializeParam(
          data['msgtot'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SysVarsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SysVarsStruct &&
        hdd == other.hdd &&
        response == other.response &&
        memory == other.memory &&
        acctAct == other.acctAct &&
        calls == other.calls &&
        msgtot == other.msgtot &&
        time == other.time;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([hdd, response, memory, acctAct, calls, msgtot, time]);
}

SysVarsStruct createSysVarsStruct({
  String? hdd,
  String? response,
  String? memory,
  int? acctAct,
  int? calls,
  int? msgtot,
  DateTime? time,
}) =>
    SysVarsStruct(
      hdd: hdd,
      response: response,
      memory: memory,
      acctAct: acctAct,
      calls: calls,
      msgtot: msgtot,
      time: time,
    );
