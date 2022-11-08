import 'package:flutter/material.dart';
import 'package:my_app/features/auth/widgets/signup_form.dart';
import 'package:my_app/theme/app_widgets/app_texts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: const[
               H1('SignIn'),
               SignupForm(),
            ],
          )),
        ),
      ),
    );
  }
}


