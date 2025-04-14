import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:parking_controller/core/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_controller/core/app_texts/app_localizations.dart';
import 'package:parking_controller/core/bloc/app_bloc.dart';
import 'package:parking_controller/core/bloc/app_state.dart';
import 'package:parking_controller/core/routes/page_routes.dart';

class ApplicationDesign extends StatelessWidget {
  const ApplicationDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = BlocProvider.of<AppBloc>(context);
        return ThemeProvider(
          duration: const Duration(milliseconds: 1000),
          initTheme: controller.getTheme(),
          builder:
              (context, theme) => MaterialApp.router(
                routerConfig: PageRoutes.router,
                title: kAppName,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale(controller.appModel.language.name),
                builder: (context, child) {
                  return child!;
                },
                debugShowCheckedModeBanner: false,
                theme: theme,
              ),
        );
      },
    );
  }
}
