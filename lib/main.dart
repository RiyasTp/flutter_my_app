import 'package:flutter/material.dart';
import 'package:my_app/features/auth/providers/login_provider.dart';
import 'package:my_app/features/auth/providers/signup_provider.dart';

import 'package:my_app/features/auth/screens/splash_screen.dart';
import 'package:my_app/features/home/providers/main_screen_provider.dart';
import 'package:my_app/theme/colors/app_colors.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
    ChangeNotifierProvider(create: (_) => MainScreenProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: kcPrimarySwatch,
      ),
      home: const SplashScreen(),
    );
  }
}
