// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChannelStruct extends BaseStruct {
  ChannelStruct({
    int? channel,
    String? msg,
    String? character,
    int? code,
  })  : _channel = channel,
        _msg = msg,
        _character = character,
        _code = code;

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

  // "character" field.
  String? _character;
  String get character => _character ?? '';
  set character(String? val) => _character = val;

  bool hasCharacter() => _character != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  static ChannelStruct fromMap(Map<String, dynamic> data) => ChannelStruct(
        channel: castToType<int>(data['channel']),
        msg: data['msg'] as String?,
        character: data['character'] as String?,
        code: castToType<int>(data['code']),
      );

  static ChannelStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChannelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'channel': _channel,
        'msg': _msg,
        'character': _character,
        'code': _code,
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
        'character': serializeParam(
          _character,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
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
        character: deserializeParam(
          data['character'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
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
        character == other.character &&
        code == other.code;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([channel, msg, character, code]);
}

ChannelStruct createChannelStruct({
  int? channel,
  String? msg,
  String? character,
  int? code,
}) =>
    ChannelStruct(
      channel: channel,
      msg: msg,
      character: character,
      code: code,
    );
