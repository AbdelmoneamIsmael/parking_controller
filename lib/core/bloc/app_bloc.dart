import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:parking_controller/core/bloc/app_event.dart';
import 'package:flutter/material.dart';
import 'package:parking_controller/core/bloc/app_state.dart';
import 'package:parking_controller/core/const/app_const.dart';
import 'package:parking_controller/core/model/app_model/app_model.dart';
import 'package:parking_controller/core/themes/theme/custom_theme.dart';
import 'package:parking_controller/core/utils/cache_helper.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      if (event is ChangeThemeEvent) {
        changeTheme();
        emit(ChangeThemeState());
      } else if (event is ChangeLanguageEvent) {
        changeLanguage();
        emit(ChangeLanguageState());
      } else if (event is AppInitEvent) {
        emit(AppLoaded());
      }
    });
    onInit();
  }
  ApplicationModel appModel = ApplicationModel(
    theme: ApplicationTheme.light,
    language: ApplicationLanguage.en,
    applicationName: kAppName,
    fontFamily: kFontFamily,
  );

  void onInit() {
    CacheHelper.getData(key: 'applicationModel') != null
        ? appModel = appModel.fromJson(
          jsonDecode(CacheHelper.getData(key: 'applicationModel')),
        )
        : appModel = ApplicationModel(
          theme: ApplicationTheme.light,
          language: ApplicationLanguage.ar,
          applicationName: kAppName,
          fontFamily: kFontFamily,
        );
  }

  changeTheme() {
    switch (appModel.theme) {
      case ApplicationTheme.light:
        appModel.theme = ApplicationTheme.dark;
        appModel.fontFamily = kFontFamily;
        break;
      case ApplicationTheme.dark:
        appModel.theme = ApplicationTheme.light;
        break;
    }
    final jsonString = jsonEncode(appModel.toJson());
    CacheHelper.saveData(key: 'applicationModel', value: jsonString);
  }

  changeLanguage() {
    switch (appModel.language) {
      case ApplicationLanguage.ar:
        appModel.language = ApplicationLanguage.en;

        appModel.fontFamily = kFontFamily;
        break;
      case ApplicationLanguage.en:
        appModel.language = ApplicationLanguage.ar;

        appModel.fontFamily = kFontFamily;
        break;
    }

    final jsonString = jsonEncode(appModel.toJson());

    CacheHelper.saveData(key: 'applicationModel', value: jsonString);
  }

  ThemeData getTheme() {
    switch (appModel.theme) {
      case ApplicationTheme.light:
        return lightTheme;
      case ApplicationTheme.dark:
        return darkTheme;
    }
  }
}
