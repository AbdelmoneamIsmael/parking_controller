import 'package:parking_controller/core/layout/mobile_layout_screen/mobile_layout_screen.dart';
import 'package:parking_controller/core/layout/select_layout_screen.dart';
import 'package:parking_controller/core/layout/tablet_layout_screen/tablet_layout_screen.dart.dart';
import 'package:parking_controller/core/layout/web_layout_screen/web_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parking_controller/core/bloc/app_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParkingController extends StatelessWidget {
  const ParkingController({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    return BlocProvider(
      create: (context) => AppBloc(),
      child: SelectLayoutSCreen(
        mobileBuilder: (context) => const MobileLayOut(),
        tabletBuilder: (context) => const TabletLayOut(),
        webBuilder: (context) => const WebLayOut(),
      ),
    );
  }
}
