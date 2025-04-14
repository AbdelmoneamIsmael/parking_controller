import 'package:parking_controller/core/const/app_const.dart';
import 'package:url_launcher/url_launcher_string.dart';

newTapNavigation({required String path, bool apllicationPath = true}) {
  String navigationPath = path;
  if (apllicationPath) {
    navigationPath = "$appUrl#$path";
  } else {
    navigationPath = path;
  }
  launchUrlString(navigationPath, mode: LaunchMode.externalApplication);
}
