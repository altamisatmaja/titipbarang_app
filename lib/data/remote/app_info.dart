import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';

abstract class AppInfo {
  static late PackageInfo packageInfo;
  static AndroidDeviceInfo? androidInfo;
  static IosDeviceInfo? iosInfo;
  static WindowsDeviceInfo? windowsInfo;

  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isAndroid) {
      androidInfo = await DeviceInfoPlugin().androidInfo;
    } else if (Platform.isIOS) {
      iosInfo = await DeviceInfoPlugin().iosInfo;
    } else if (Platform.isWindows) {
      windowsInfo = await DeviceInfoPlugin().windowsInfo;
    }
  }

  static String appVersion = AppInfo.packageInfo.version;
  static String buildNumber = AppInfo.packageInfo.buildNumber;
  static String packageName = AppInfo.packageInfo.packageName;
  static int androidSdk = androidInfo?.version.sdkInt ?? 0;
  static String formattedVersion = 'v$appVersion+$buildNumber';
}
