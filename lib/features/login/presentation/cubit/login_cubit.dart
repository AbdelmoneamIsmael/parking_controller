import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:parking_controller/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void makeLogin() {
    if (formKey.currentState!.validate()) {}
  }
}
