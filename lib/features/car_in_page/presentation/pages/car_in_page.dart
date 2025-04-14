import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_controller/core/app_texts/app_localizations.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';
import 'package:parking_controller/core/widgets/app_drop_down.dart';
import 'package:parking_controller/core/widgets/app_text_field.dart';
import 'package:parking_controller/core/widgets/primary_button.dart';
import 'package:parking_controller/features/car_in_page/presentation/cubit/car_in_page_cubit.dart';
import 'package:parking_controller/features/car_in_page/presentation/cubit/car_in_page_state.dart';
import 'package:parking_controller/gen/assets.gen.dart';

class CarInPage extends StatelessWidget {
  const CarInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarInPageCubit, CarInPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = context.read<CarInPageCubit>();
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: PrimaryButton(
              text: AppLocalizations.of(context).save,
              onPressed: cubit.onSubmit,
            ),
          ),
          appBar: AppBar(title: Text(AppLocalizations.of(context).carIn)),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(22.w),
            child: Form(
              key: cubit.formKey,
              child: Column(
                spacing: 20,
                children: [
                  SvgPicture.asset(Assets.icons.carIn),
                  SizedBox(height: 50.h),
                  AppTextFieldWithTitle(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context).requiredParameter;
                      }
                      return null;
                    },
                    title: AppLocalizations.of(context).carNumber,
                    hint: AppLocalizations.of(context).enterCarNumber,
                    controller: cubit.carNumberController,
                    autofillHints: [AutofillHints.newUsername],
                  ),
                  Row(
                    children: [
                      Switch.adaptive(
                        value: cubit.isPrePaid,
                        onChanged: cubit.onPrePaidChanged,
                      ),
                      cubit.isPrePaid
                          ? Expanded(
                            child: AppTextFieldWithTitle(
                              important: false,
                              title: AppLocalizations.of(context).prePaid,
                              hint: AppLocalizations.of(context).enterprePaid,
                              keyboardType: TextInputType.number,
                              controller: cubit.prePaidController,
                              autofillHints: [AutofillHints.creditCardNumber],
                            ),
                          )
                          : Text(
                            AppLocalizations.of(context).gift,
                            style: AppTextStyle.meduim(
                              context,
                            ).copyWith(fontSize: 16.sp),
                          ),
                    ],
                  ),
                  AppTextFieldWithTitle(
                    autofillHints: [AutofillHints.name],
                    controller: cubit.driverNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context).requiredParameter;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    title: AppLocalizations.of(context).driverName,
                    hint: AppLocalizations.of(context).enterDriverName,
                  ),
                  AppTextFieldWithTitle(
                    controller: cubit.driverPhoneController,
                    autofillHints: [AutofillHints.telephoneNumber],
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context).requiredParameter;
                      }
                      return null;
                    },
                    title: AppLocalizations.of(context).driverPhone,
                    hint: AppLocalizations.of(context).enterDriverPhone,
                  ),
                  GestureDetector(
                    onTap:
                        () => showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: Color(
                                      int.parse(cubit.carColorController.text),
                                    ),
                                    onColorChanged: cubit.changeCarColor,
                                  ),
                                ),
                              ),
                        ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: AppTextFieldWithTitle(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(
                                  context,
                                ).requiredParameter;
                              }
                              return null;
                            },
                            controller: cubit.carColorController,
                            autofillHints: [AutofillHints.name],
                            readOnly: true,
                            title: AppLocalizations.of(context).carColor,
                            hint: AppLocalizations.of(context).enterCarColor,
                          ),
                        ),
                        const SizedBox(width: 22),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 22).w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Color(
                                int.parse(cubit.carColorController.text),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDropdown(
                    items: [
                      DropdownMenuItem(
                        value: '1',
                        child: Text(AppLocalizations.of(context).save),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text(AppLocalizations.of(context).help),
                      ),
                      DropdownMenuItem(
                        value: '3',
                        child: Text(AppLocalizations.of(context).gift),
                      ),
                    ],

                    hint: AppLocalizations.of(context).enterCarType,
                    onChanged: (value) {
                      cubit.carTypeController.text = value.toString();
                    },
                  ),
                  AppTextFieldWithTitle(
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        var time = await showTimePicker(
                          context: context,

                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          cubit.changeCarInTime(date, time);
                        }
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context).requiredParameter;
                      }
                      return null;
                    },
                    controller: cubit.carInTimeController,
                    autofillHints: [AutofillHints.creditCardExpirationDate],
                    keyboardType: TextInputType.datetime,
                    readOnly: true,
                    title: AppLocalizations.of(context).carInTime,
                    hint: AppLocalizations.of(context).enterCarInTime,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
