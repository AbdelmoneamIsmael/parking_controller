import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_controller/core/app_texts/app_localizations.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';
import 'package:parking_controller/gen/assets.gen.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hint,
    this.prefixIcon,
    this.withBorder = true,
    this.fillColor,
    this.value,
  });
  final List<DropdownMenuItem> items;
  final void Function(dynamic) onChanged;
  final String hint;
  final Widget? prefixIcon;
  final value;
  final bool withBorder;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      isExpanded: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      alignment: AlignmentDirectional.centerStart,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 3.w),
        hintStyle: AppTextStyle.regular(
          context,
        ).copyWith(color: Theme.of(context).textTheme.bodySmall!.color),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .8,
            color:
                withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
          ),
        ),
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .8,
            color:
                withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .8,
            color:
                withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .8,
            color:
                withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .8,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        prefixIcon: prefixIcon,
      ),
      hint: Text(
        hint,
        style: AppTextStyle.regular(context).copyWith(
          fontSize: 14.sp,
          color: Theme.of(context).textTheme.bodySmall!.color,
          height: 1.4,
        ),
      ),
      iconStyleData: IconStyleData(
        icon: SvgPicture.asset(
          Assets.icons.chevronDown,
          fit: BoxFit.scaleDown,
          width: 24.w,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      style: AppTextStyle.meduim(context).copyWith(height: 1),
      validator:
          (value) =>
              value == null
                  ? AppLocalizations.of(context).requiredParameter
                  : null,
      isDense: false,
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
