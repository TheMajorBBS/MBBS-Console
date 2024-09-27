// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecordStruct extends BaseStruct {
  UserRecordStruct({
    String? name,
    String? addr1,
    String? addr2,
    String? addr3,
    String? addr4,
    String? phone,
    DateTime? born,
    String? sex,
    String? defaultEditor,
    String? system,
    String? screen,
    String? userClass,
    String? passwd,
    int? creditAvail,
    int? creditTotal,
    int? creditsPaid,
    String? hasMaster,
    String? suspended,
    String? tagForKill,
    String? protected,
    String? username,
    DateTime? acctCreated,
    DateTime? lastCall,
    double? dayUsage,
  })  : _name = name,
        _addr1 = addr1,
        _addr2 = addr2,
        _addr3 = addr3,
        _addr4 = addr4,
        _phone = phone,
        _born = born,
        _sex = sex,
        _defaultEditor = defaultEditor,
        _system = system,
        _screen = screen,
        _userClass = userClass,
        _passwd = passwd,
        _creditAvail = creditAvail,
        _creditTotal = creditTotal,
        _creditsPaid = creditsPaid,
        _hasMaster = hasMaster,
        _suspended = suspended,
        _tagForKill = tagForKill,
        _protected = protected,
        _username = username,
        _acctCreated = acctCreated,
        _lastCall = lastCall,
        _dayUsage = dayUsage;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Addr1" field.
  String? _addr1;
  String get addr1 => _addr1 ?? '';
  set addr1(String? val) => _addr1 = val;

  bool hasAddr1() => _addr1 != null;

  // "Addr2" field.
  String? _addr2;
  String get addr2 => _addr2 ?? '';
  set addr2(String? val) => _addr2 = val;

  bool hasAddr2() => _addr2 != null;

  // "Addr3" field.
  String? _addr3;
  String get addr3 => _addr3 ?? '';
  set addr3(String? val) => _addr3 = val;

  bool hasAddr3() => _addr3 != null;

  // "Addr4" field.
  String? _addr4;
  String get addr4 => _addr4 ?? '';
  set addr4(String? val) => _addr4 = val;

  bool hasAddr4() => _addr4 != null;

  // "Phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "Born" field.
  DateTime? _born;
  DateTime? get born => _born;
  set born(DateTime? val) => _born = val;

  bool hasBorn() => _born != null;

  // "Sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  set sex(String? val) => _sex = val;

  bool hasSex() => _sex != null;

  // "DefaultEditor" field.
  String? _defaultEditor;
  String get defaultEditor => _defaultEditor ?? '';
  set defaultEditor(String? val) => _defaultEditor = val;

  bool hasDefaultEditor() => _defaultEditor != null;

  // "System" field.
  String? _system;
  String get system => _system ?? '';
  set system(String? val) => _system = val;

  bool hasSystem() => _system != null;

  // "Screen" field.
  String? _screen;
  String get screen => _screen ?? '';
  set screen(String? val) => _screen = val;

  bool hasScreen() => _screen != null;

  // "UserClass" field.
  String? _userClass;
  String get userClass => _userClass ?? '';
  set userClass(String? val) => _userClass = val;

  bool hasUserClass() => _userClass != null;

  // "Passwd" field.
  String? _passwd;
  String get passwd => _passwd ?? '';
  set passwd(String? val) => _passwd = val;

  bool hasPasswd() => _passwd != null;

  // "CreditAvail" field.
  int? _creditAvail;
  int get creditAvail => _creditAvail ?? 0;
  set creditAvail(int? val) => _creditAvail = val;

  void incrementCreditAvail(int amount) => creditAvail = creditAvail + amount;

  bool hasCreditAvail() => _creditAvail != null;

  // "CreditTotal" field.
  int? _creditTotal;
  int get creditTotal => _creditTotal ?? 0;
  set creditTotal(int? val) => _creditTotal = val;

  void incrementCreditTotal(int amount) => creditTotal = creditTotal + amount;

  bool hasCreditTotal() => _creditTotal != null;

  // "CreditsPaid" field.
  int? _creditsPaid;
  int get creditsPaid => _creditsPaid ?? 0;
  set creditsPaid(int? val) => _creditsPaid = val;

  void incrementCreditsPaid(int amount) => creditsPaid = creditsPaid + amount;

  bool hasCreditsPaid() => _creditsPaid != null;

  // "HasMaster" field.
  String? _hasMaster;
  String get hasMaster => _hasMaster ?? '';
  set hasMaster(String? val) => _hasMaster = val;

  bool hasHasMaster() => _hasMaster != null;

  // "Suspended" field.
  String? _suspended;
  String get suspended => _suspended ?? '';
  set suspended(String? val) => _suspended = val;

  bool hasSuspended() => _suspended != null;

  // "TagForKill" field.
  String? _tagForKill;
  String get tagForKill => _tagForKill ?? '';
  set tagForKill(String? val) => _tagForKill = val;

  bool hasTagForKill() => _tagForKill != null;

  // "Protected" field.
  String? _protected;
  String get protected => _protected ?? '';
  set protected(String? val) => _protected = val;

  bool hasProtected() => _protected != null;

  // "Username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "AcctCreated" field.
  DateTime? _acctCreated;
  DateTime? get acctCreated => _acctCreated;
  set acctCreated(DateTime? val) => _acctCreated = val;

  bool hasAcctCreated() => _acctCreated != null;

  // "LastCall" field.
  DateTime? _lastCall;
  DateTime? get lastCall => _lastCall;
  set lastCall(DateTime? val) => _lastCall = val;

  bool hasLastCall() => _lastCall != null;

  // "DayUsage" field.
  double? _dayUsage;
  double get dayUsage => _dayUsage ?? 0.0;
  set dayUsage(double? val) => _dayUsage = val;

  void incrementDayUsage(double amount) => dayUsage = dayUsage + amount;

  bool hasDayUsage() => _dayUsage != null;

  static UserRecordStruct fromMap(Map<String, dynamic> data) =>
      UserRecordStruct(
        name: data['Name'] as String?,
        addr1: data['Addr1'] as String?,
        addr2: data['Addr2'] as String?,
        addr3: data['Addr3'] as String?,
        addr4: data['Addr4'] as String?,
        phone: data['Phone'] as String?,
        born: data['Born'] as DateTime?,
        sex: data['Sex'] as String?,
        defaultEditor: data['DefaultEditor'] as String?,
        system: data['System'] as String?,
        screen: data['Screen'] as String?,
        userClass: data['UserClass'] as String?,
        passwd: data['Passwd'] as String?,
        creditAvail: castToType<int>(data['CreditAvail']),
        creditTotal: castToType<int>(data['CreditTotal']),
        creditsPaid: castToType<int>(data['CreditsPaid']),
        hasMaster: data['HasMaster'] as String?,
        suspended: data['Suspended'] as String?,
        tagForKill: data['TagForKill'] as String?,
        protected: data['Protected'] as String?,
        username: data['Username'] as String?,
        acctCreated: data['AcctCreated'] as DateTime?,
        lastCall: data['LastCall'] as DateTime?,
        dayUsage: castToType<double>(data['DayUsage']),
      );

  static UserRecordStruct? maybeFromMap(dynamic data) => data is Map
      ? UserRecordStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Addr1': _addr1,
        'Addr2': _addr2,
        'Addr3': _addr3,
        'Addr4': _addr4,
        'Phone': _phone,
        'Born': _born,
        'Sex': _sex,
        'DefaultEditor': _defaultEditor,
        'System': _system,
        'Screen': _screen,
        'UserClass': _userClass,
        'Passwd': _passwd,
        'CreditAvail': _creditAvail,
        'CreditTotal': _creditTotal,
        'CreditsPaid': _creditsPaid,
        'HasMaster': _hasMaster,
        'Suspended': _suspended,
        'TagForKill': _tagForKill,
        'Protected': _protected,
        'Username': _username,
        'AcctCreated': _acctCreated,
        'LastCall': _lastCall,
        'DayUsage': _dayUsage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Addr1': serializeParam(
          _addr1,
          ParamType.String,
        ),
        'Addr2': serializeParam(
          _addr2,
          ParamType.String,
        ),
        'Addr3': serializeParam(
          _addr3,
          ParamType.String,
        ),
        'Addr4': serializeParam(
          _addr4,
          ParamType.String,
        ),
        'Phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'Born': serializeParam(
          _born,
          ParamType.DateTime,
        ),
        'Sex': serializeParam(
          _sex,
          ParamType.String,
        ),
        'DefaultEditor': serializeParam(
          _defaultEditor,
          ParamType.String,
        ),
        'System': serializeParam(
          _system,
          ParamType.String,
        ),
        'Screen': serializeParam(
          _screen,
          ParamType.String,
        ),
        'UserClass': serializeParam(
          _userClass,
          ParamType.String,
        ),
        'Passwd': serializeParam(
          _passwd,
          ParamType.String,
        ),
        'CreditAvail': serializeParam(
          _creditAvail,
          ParamType.int,
        ),
        'CreditTotal': serializeParam(
          _creditTotal,
          ParamType.int,
        ),
        'CreditsPaid': serializeParam(
          _creditsPaid,
          ParamType.int,
        ),
        'HasMaster': serializeParam(
          _hasMaster,
          ParamType.String,
        ),
        'Suspended': serializeParam(
          _suspended,
          ParamType.String,
        ),
        'TagForKill': serializeParam(
          _tagForKill,
          ParamType.String,
        ),
        'Protected': serializeParam(
          _protected,
          ParamType.String,
        ),
        'Username': serializeParam(
          _username,
          ParamType.String,
        ),
        'AcctCreated': serializeParam(
          _acctCreated,
          ParamType.DateTime,
        ),
        'LastCall': serializeParam(
          _lastCall,
          ParamType.DateTime,
        ),
        'DayUsage': serializeParam(
          _dayUsage,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserRecordStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserRecordStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        addr1: deserializeParam(
          data['Addr1'],
          ParamType.String,
          false,
        ),
        addr2: deserializeParam(
          data['Addr2'],
          ParamType.String,
          false,
        ),
        addr3: deserializeParam(
          data['Addr3'],
          ParamType.String,
          false,
        ),
        addr4: deserializeParam(
          data['Addr4'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['Phone'],
          ParamType.String,
          false,
        ),
        born: deserializeParam(
          data['Born'],
          ParamType.DateTime,
          false,
        ),
        sex: deserializeParam(
          data['Sex'],
          ParamType.String,
          false,
        ),
        defaultEditor: deserializeParam(
          data['DefaultEditor'],
          ParamType.String,
          false,
        ),
        system: deserializeParam(
          data['System'],
          ParamType.String,
          false,
        ),
        screen: deserializeParam(
          data['Screen'],
          ParamType.String,
          false,
        ),
        userClass: deserializeParam(
          data['UserClass'],
          ParamType.String,
          false,
        ),
        passwd: deserializeParam(
          data['Passwd'],
          ParamType.String,
          false,
        ),
        creditAvail: deserializeParam(
          data['CreditAvail'],
          ParamType.int,
          false,
        ),
        creditTotal: deserializeParam(
          data['CreditTotal'],
          ParamType.int,
          false,
        ),
        creditsPaid: deserializeParam(
          data['CreditsPaid'],
          ParamType.int,
          false,
        ),
        hasMaster: deserializeParam(
          data['HasMaster'],
          ParamType.String,
          false,
        ),
        suspended: deserializeParam(
          data['Suspended'],
          ParamType.String,
          false,
        ),
        tagForKill: deserializeParam(
          data['TagForKill'],
          ParamType.String,
          false,
        ),
        protected: deserializeParam(
          data['Protected'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['Username'],
          ParamType.String,
          false,
        ),
        acctCreated: deserializeParam(
          data['AcctCreated'],
          ParamType.DateTime,
          false,
        ),
        lastCall: deserializeParam(
          data['LastCall'],
          ParamType.DateTime,
          false,
        ),
        dayUsage: deserializeParam(
          data['DayUsage'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UserRecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserRecordStruct &&
        name == other.name &&
        addr1 == other.addr1 &&
        addr2 == other.addr2 &&
        addr3 == other.addr3 &&
        addr4 == other.addr4 &&
        phone == other.phone &&
        born == other.born &&
        sex == other.sex &&
        defaultEditor == other.defaultEditor &&
        system == other.system &&
        screen == other.screen &&
        userClass == other.userClass &&
        passwd == other.passwd &&
        creditAvail == other.creditAvail &&
        creditTotal == other.creditTotal &&
        creditsPaid == other.creditsPaid &&
        hasMaster == other.hasMaster &&
        suspended == other.suspended &&
        tagForKill == other.tagForKill &&
        protected == other.protected &&
        username == other.username &&
        acctCreated == other.acctCreated &&
        lastCall == other.lastCall &&
        dayUsage == other.dayUsage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        addr1,
        addr2,
        addr3,
        addr4,
        phone,
        born,
        sex,
        defaultEditor,
        system,
        screen,
        userClass,
        passwd,
        creditAvail,
        creditTotal,
        creditsPaid,
        hasMaster,
        suspended,
        tagForKill,
        protected,
        username,
        acctCreated,
        lastCall,
        dayUsage
      ]);
}

UserRecordStruct createUserRecordStruct({
  String? name,
  String? addr1,
  String? addr2,
  String? addr3,
  String? addr4,
  String? phone,
  DateTime? born,
  String? sex,
  String? defaultEditor,
  String? system,
  String? screen,
  String? userClass,
  String? passwd,
  int? creditAvail,
  int? creditTotal,
  int? creditsPaid,
  String? hasMaster,
  String? suspended,
  String? tagForKill,
  String? protected,
  String? username,
  DateTime? acctCreated,
  DateTime? lastCall,
  double? dayUsage,
}) =>
    UserRecordStruct(
      name: name,
      addr1: addr1,
      addr2: addr2,
      addr3: addr3,
      addr4: addr4,
      phone: phone,
      born: born,
      sex: sex,
      defaultEditor: defaultEditor,
      system: system,
      screen: screen,
      userClass: userClass,
      passwd: passwd,
      creditAvail: creditAvail,
      creditTotal: creditTotal,
      creditsPaid: creditsPaid,
      hasMaster: hasMaster,
      suspended: suspended,
      tagForKill: tagForKill,
      protected: protected,
      username: username,
      acctCreated: acctCreated,
      lastCall: lastCall,
      dayUsage: dayUsage,
    );
