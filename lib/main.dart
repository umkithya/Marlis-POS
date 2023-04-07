import 'package:flutter/material.dart';
import 'package:malispos/config/routes.dart';

import 'app/core/values/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.router,
      // title: 'Flutter Demo',
      theme: lightThemeData,
      themeMode: ThemeMode.light,
      // home: const MyHomePage(),
    );
  }
}
