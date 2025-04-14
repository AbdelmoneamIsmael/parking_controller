import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_controller/core/layout/app_core_design.dart';

class MobileLayOut extends StatelessWidget {
  const MobileLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ApplicationDesign();
      },
    );
  }
}
