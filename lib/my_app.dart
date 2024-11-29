import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/presentation/screens/home/article_details/article_details.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RoutesManager.home: (context) => HomeScreen(),
          RoutesManager.splash: (context) => const SplashScreen(),
          RoutesManager.articlesDetails: (context) => ArticleDetails(),

        },
        initialRoute: RoutesManager.splash,
        theme: Apptheme.theme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
