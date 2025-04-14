import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_controller/core/utils/functions/get_hight.dart';

abstract class AppTextStyle {
  // static late BuildContext context;
  // static setContext(BuildContext ctx) {
  //   print ("setContext");
  //   return context (BuildContext context)=> ctx;
  // }
  //regular

  static TextStyle regular(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle meduim(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle semiBold(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle bold(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    height: 1,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
}
