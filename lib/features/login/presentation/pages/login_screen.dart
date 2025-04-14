import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_controller/core/app_texts/app_localizations.dart';
import 'package:parking_controller/core/app_texts/app_localizations_ar.dart';
import 'package:parking_controller/core/app_texts/app_localizations_en.dart';
import 'package:parking_controller/core/themes/styles/app_text_style.dart';
import 'package:parking_controller/core/widgets/app_text_field.dart';
import 'package:parking_controller/core/widgets/primary_button.dart';
import 'package:parking_controller/features/login/presentation/cubit/login_cubit.dart';
import 'package:parking_controller/features/login/presentation/cubit/login_state.dart';
import 'package:parking_controller/gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.icons.loginIcon),
                        const SizedBox(height: 50),
                        AppTextFieldWithTitle(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              ).please_enter_email;
                            }
                            return null;
                          },
                          title: AppLocalizations.of(context).email,
                          hint: AppLocalizations.of(context).please_enter_email,
                        ),
                        const SizedBox(height: 20),
                        AppTextFieldWithTitle(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              ).please_enter_password;
                            }
                            return null;
                          },
                          title: AppLocalizations.of(context).password,
                          hint:
                              AppLocalizations.of(
                                context,
                              ).please_enter_password,
                        ),
                        const SizedBox(height: 30),
                        PrimaryButton(
                          text: AppLocalizations.of(context).login,
                          onPressed: cubit.makeLogin,
                        ),
                        const SizedBox(height: 30),
                        // const Row(
                        //   spacing: 10,
                        //   children: [
                        //     Expanded(child: Divider(thickness: 1)),

                        //     Text("OR"),
                        //     Expanded(child: Divider(thickness: 1)),
                        //   ],
                        // ),
                        // const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
