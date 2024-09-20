// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChannelStruct extends BaseStruct {
  ChannelStruct({
    int? channel,
    String? msg,
    int? code,
    int? character,
  })  : _channel = channel,
        _msg = msg,
        _code = code,
        _character = character;

  // "channel" field.
  int? _channel;
  int get channel => _channel ?? 0;
  set channel(int? val) => _channel = val;

  void incrementChannel(int amount) => channel = channel + amount;

  bool hasChannel() => _channel != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  set msg(String? val) => _msg = val;

  bool hasMsg() => _msg != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "character" field.
  int? _character;
  int get character => _character ?? 0;
  set character(int? val) => _character = val;

  void incrementCharacter(int amount) => character = character + amount;

  bool hasCharacter() => _character != null;

  static ChannelStruct fromMap(Map<String, dynamic> data) => ChannelStruct(
        channel: castToType<int>(data['channel']),
        msg: data['msg'] as String?,
        code: castToType<int>(data['code']),
        character: castToType<int>(data['character']),
      );

  static ChannelStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChannelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'channel': _channel,
        'msg': _msg,
        'code': _code,
        'character': _character,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'channel': serializeParam(
          _channel,
          ParamType.int,
        ),
        'msg': serializeParam(
          _msg,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'character': serializeParam(
          _character,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChannelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChannelStruct(
        channel: deserializeParam(
          data['channel'],
          ParamType.int,
          false,
        ),
        msg: deserializeParam(
          data['msg'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        character: deserializeParam(
          data['character'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChannelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChannelStruct &&
        channel == other.channel &&
        msg == other.msg &&
        code == other.code &&
        character == other.character;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([channel, msg, code, character]);
}

ChannelStruct createChannelStruct({
  int? channel,
  String? msg,
  int? code,
  int? character,
}) =>
    ChannelStruct(
      channel: channel,
      msg: msg,
      code: code,
      character: character,
    );
