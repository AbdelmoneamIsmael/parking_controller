import 'package:flutter/material.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';
import 'package:parking_controller/core/widgets/loading.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.onSecondaryTap,
  });
  final String text;
  final VoidCallback? onPressed, onSecondaryTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? ElevatedButton(
          onPressed: () {},
          child: const LoadingWidget(color: Colors.white, loadingSize: 24),
        )
        : InkWell(
          onSecondaryTap: onSecondaryTap,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: AppTextStyle.meduim(
                context,
              ).copyWith(color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ),
        );
  }
}
