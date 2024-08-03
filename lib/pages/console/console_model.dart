import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'console_widget.dart' show ConsoleWidget;
import 'package:flutter/material.dart';

class ConsoleModel extends FlutterFlowModel<ConsoleWidget> {
  ///  Local state fields for this page.

  List<ChannelStruct> channelList = [];
  void addToChannelList(ChannelStruct item) => channelList.add(item);
  void removeFromChannelList(ChannelStruct item) => channelList.remove(item);
  void removeAtIndexFromChannelList(int index) => channelList.removeAt(index);
  void insertAtIndexInChannelList(int index, ChannelStruct item) =>
      channelList.insert(index, item);
  void updateChannelListAtIndex(int index, Function(ChannelStruct) updateFn) =>
      channelList[index] = updateFn(channelList[index]);

  List<AuditStruct> auditList = [];
  void addToAuditList(AuditStruct item) => auditList.add(item);
  void removeFromAuditList(AuditStruct item) => auditList.remove(item);
  void removeAtIndexFromAuditList(int index) => auditList.removeAt(index);
  void insertAtIndexInAuditList(int index, AuditStruct item) =>
      auditList.insert(index, item);
  void updateAuditListAtIndex(int index, Function(AuditStruct) updateFn) =>
      auditList[index] = updateFn(auditList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? stateTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    stateTime?.cancel();
  }
}
