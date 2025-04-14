import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_controller/core/app_texts/app_localizations.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';
import 'package:parking_controller/core/widgets/app_text_field.dart';
import 'package:parking_controller/features/car_out/presentation/cubit/car_out_cubit.dart';
import 'package:parking_controller/features/car_out/presentation/cubit/car_out_state.dart';
import 'package:parking_controller/gen/assets.gen.dart';

class CarOutScreen extends StatelessWidget {
  const CarOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarOutCubit, CarOutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<CarOutCubit>();
        return Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context).carOut)),
          body: Column(
            spacing: 20,
            children: [
              const SizedBox(),
              const SizedBox(),
              // SvgPicture.asset(Assets.icons.selectOperation),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 22).w,
                    padding: const EdgeInsets.all(40).w,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        Expanded(child: SvgPicture.asset(Assets.icons.scanQr)),
                        SizedBox(height: 40.h),
                        Text(
                          AppLocalizations.of(context).qrCode,
                          style: AppTextStyle.bold(
                            context,
                          ).copyWith(fontSize: 20.sp),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 22).w,
                    padding: const EdgeInsets.all(22).w,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              Assets.icons.carNumber,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          AppTextFieldWithTitle(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(
                                  context,
                                ).requiredParameter;
                              }
                              return null;
                            },
                            title: AppLocalizations.of(context).carNumber,
                            hint: AppLocalizations.of(context).carNumber,
                          ),

                          SizedBox(height: 10.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(double.maxFinite, 30.h),
                            ),

                            onPressed: cubit.onCodeSubmit,
                            child: Text(AppLocalizations.of(context).search),
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
