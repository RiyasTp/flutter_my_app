import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/features/auth/providers/login_provider.dart';
import 'package:my_app/theme/colors/app_colors.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kcPrimary,
      body: Center(
        child: Text(
          'Diner',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 38,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
   final provider = context.read<LoginProvider>();
    Timer(
      const Duration(seconds: 2),
      () => provider.isAlreadyLogin(context),
    );
    super.initState();
  }
}
