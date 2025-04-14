import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_controller/core/app_texts/app_localizations.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';
import 'package:parking_controller/gen/assets.gen.dart';

class SelectOperation extends StatelessWidget {
  const SelectOperation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).selectOperation)),
      body: Column(
        spacing: 20,
        children: [
          const SizedBox(),
          const SizedBox(),
          // SvgPicture.asset(Assets.icons.selectOperation),
          Expanded(
            child: OperationWidget(
              iconPath: Assets.icons.carIn,
              title: AppLocalizations.of(context).carIn,
            ),
          ),
          Expanded(
            child: OperationWidget(
              iconPath: Assets.icons.carOut,
              title: AppLocalizations.of(context).carOut,
            ),
          ),
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    );
  }
}

class OperationWidget extends StatelessWidget {
  const OperationWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });
  final String iconPath, title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22).w,
        padding: const EdgeInsets.all(22).w,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset(iconPath)),
            SizedBox(height: 40.h),
            Text(
              title,
              style: AppTextStyle.bold(context).copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
