export 'platform_util_stub.dart'
    if (dart.library.io) 'platform_util_native.dart'
    if (dart.library.html) 'platform_util_web.dart';
