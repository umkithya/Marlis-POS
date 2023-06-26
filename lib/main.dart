import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:malispos/firebase_options.dart';

import 'app/config/routes.dart';
import 'app/core/values/text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      theme: lightThemeData,
      // themeMode: ThemeMode.light,
    );
  }
}
