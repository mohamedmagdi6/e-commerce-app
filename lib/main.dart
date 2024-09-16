import 'package:e_commerce_app/core/my_bloc_observer.dart';
import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
        home: child,
      ),
    );
  }
}
