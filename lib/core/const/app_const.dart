import 'package:get_it/get_it.dart';

const String kAppName = "Parking";
const kFontFamily = "Cairo";
const knotification = "notification";
const baseUrl = 'https://perfume.runasp.net';
String appUrl = "";
String initialRoute = "";
String kDeviceToken = "";
// const String baseURl = "https://generators.runasp.net";
final getIt = GetIt.instance;

abstract class HiveKeys {}

abstract class StorageKeys {
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";

  static const String lang = "lang";

  static const String userBox = "userBox";
  static const String userInfoBox = "userInfoBox";
  static const String adressBox = "adressBox";
}
