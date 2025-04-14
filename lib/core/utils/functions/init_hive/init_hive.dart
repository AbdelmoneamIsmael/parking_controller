import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveInitialization() async {
  await Hive.initFlutter();
}
