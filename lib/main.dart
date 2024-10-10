import 'package:e_commerce_app/core/my_bloc_observer.dart';
import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/shared_prefrence_utils.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/cart/screens/cart_screen_cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app/features/main_layout/favourite/presentation/favourite_screen_cubit/favourite_screen_view_model.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab_cubits/home_tab_view_model.dart';
import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceUtils.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<HomeTabViewModel>()),
    BlocProvider(create: (context) => getIt<ProductsScreenViewModel>()),
    BlocProvider(create: (context) => getIt<CartScreenViewModel>()),
    BlocProvider(create: (context) => getIt<FavouriteScreenViewModel>()),
  ], child: const MyApp()));
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
        initialRoute: SharedPrefrenceUtils.getData(key: 'token') == null
            ? Routes.splashScreenRoute
            : Routes.mainRoute,
        home: child,
      ),
    );
  }
}
