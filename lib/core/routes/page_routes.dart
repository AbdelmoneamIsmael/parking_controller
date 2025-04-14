import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_controller/core/routes/pages_keys.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_controller/core/const/app_const.dart';
import 'package:parking_controller/features/car_in_page/presentation/cubit/car_in_page_cubit.dart';
import 'package:parking_controller/features/car_in_page/presentation/pages/car_in_page.dart';
import 'package:parking_controller/features/car_out/presentation/cubit/car_out_cubit.dart';
import 'package:parking_controller/features/car_out/presentation/pages/car_out_screen.dart';
import 'package:parking_controller/features/login/presentation/cubit/login_cubit.dart';
import 'package:parking_controller/features/login/presentation/pages/login_screen.dart';
import 'package:parking_controller/core/bloc/bloc_observer.dart';
import 'package:parking_controller/features/selecct_operation/presentation/cubit/selecct_operation_cubit.dart';
import 'package:parking_controller/features/selecct_operation/presentation/pages/select_operation.dart';

class PageRoutes {
  static GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErorPage(),
    initialLocation:
        initialRoute.isEmpty ? PagesKeys.loginScreen : initialRoute,
    observers: [MyNavigatorObserver()],
    routes: [
      GoRoute(
        path: PagesKeys.loginScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: PagesKeys.selectOperation,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SelecctOperationCubit(),
            child: const SelectOperation(),
          );
        },
      ),
      GoRoute(
        path: PagesKeys.addNewOperation,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => CarInPageCubit(),
            child: const CarInPage(),
          );
        },
      ),
      GoRoute(
        path: PagesKeys.signOperationout,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => CarOutCubit(),
            child: const CarOutScreen(),
          );
        },
      ),
    ],
  );
  static clearAndNavigate(String path) {
    while (router.canPop() == true) {
      router.pop();
    }
    router.go(path);
  }
}

class ErorPage extends StatelessWidget {
  const ErorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Error")));
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('did push route ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('did pop route ${route.settings.name}');
  }
}
