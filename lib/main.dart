// import 'dart:html' as web;
import 'package:parking_controller/core/bloc/bloc_observer.dart';

import 'package:parking_controller/core/utils/cache_helper.dart';
import 'package:parking_controller/core/utils/functions/init_hive/init_hive.dart';
import 'package:parking_controller/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_controller/app_configration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // String url = window.location.href;
  // if (url.split('#').length > 1) {
  //   initialRoute = url.split('#')[1];
  //   PrintHelper(initialRoute);
  // }
  // appUrl = url.split('#')[0];
  // print(appUrl);

  // window.document.onContextMenu.listen((evt) => evt.preventDefault());
  await initializing();
  initializeGetIt();
  await hiveInitialization();
  await CacheHelper.init();
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(MainErrorScreen(details: details));
  // };
  runApp(const ParkingController());
}

Future<void> initializing() async {
  Bloc.observer = MyBlocObserver();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // var deviceToken = await NotificationHelper.init();

  // kDeviceToken = deviceToken;
  // log(kDeviceToken);

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

class MainErrorScreen extends StatelessWidget {
  const MainErrorScreen({super.key, required this.details});
  final FlutterErrorDetails details;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                const Icon(Icons.error, color: Colors.red),
                Text(details.exceptionAsString()),
                Text(details.stack.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
