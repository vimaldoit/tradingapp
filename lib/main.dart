import 'package:flutter/material.dart';
import 'package:tradingapp/core/dependency_injection/di.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradingapp/core/router/app_router.dart';
import 'package:tradingapp/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppContainer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Size designSize;
    if (screenWidth >= 1100) {
      designSize = const Size(1440, 900); // Desktop
    } else if (screenWidth >= 650) {
      designSize = const Size(768, 1024); // Tablet
    } else {
      designSize = const Size(360, 800); // Mobile
    }
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      designSize: designSize,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
