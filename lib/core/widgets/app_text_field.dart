import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';

class AppTextFieldWithTitle extends StatelessWidget {
  const AppTextFieldWithTitle({
    super.key,
    required this.title,
    required this.hint,
    this.scure = false,
    this.enabeld = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon, this.onChanged, this.onTap,
  });
  final String title, hint;
  final bool scure, enabeld, readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? prefixIcon, suffixIcon;
   final void Function(String)? onChanged;
 final  void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title, style: AppTextStyle.meduim(context)),
            Text(
              "*",
              style: AppTextStyle.regular(
                context,
              ).copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        const SizedBox(height: 13),
        AppFormField(
          hint: hint,
          scure: scure,
          enabeld: enabeld,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
          onTap: onTap,
        ),
      ],
    );
  }
}

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.hint,
    this.scure = false,
    this.enabeld = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.withBorder = true, this.onChanged, this.onTap,
  });
  final String hint;
  final bool scure, enabeld, readOnly, withBorder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Color? fillColor;
  final Widget? prefixIcon, suffixIcon;
 final void Function(String)? onChanged;
 final  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: scure,
      onTap: onTap,
      onChanged:onChanged ,
      readOnly: readOnly,
      enabled: enabeld,
      validator: validator,
      autocorrect: true,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      minLines: maxLines,
      style: AppTextStyle.meduim(context).copyWith(height: 1),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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
        suffixIcon: suffixIcon,
      ),
    );
  }
}
