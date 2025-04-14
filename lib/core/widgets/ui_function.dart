import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';

class UiHelper {
  static showSnakBar({
    required String message,
    required BuildContext context,
    required MotionToastType type,
  }) {
    switch (type) {
      case MotionToastType.success:
        MotionToast.success(
          position: MotionToastPosition.top,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.meduim(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.error:
        MotionToast.error(
          position: MotionToastPosition.top,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.meduim(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.warning:
        MotionToast.warning(
          position: MotionToastPosition.top,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.meduim(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.info:
        MotionToast.info(
          position: MotionToastPosition.top,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.meduim(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.custom:
        MotionToast.success(
          position: MotionToastPosition.top,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.meduim(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
    }
  }
}
