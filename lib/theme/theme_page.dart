import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/theme/app_widgets/app_button.dart';
import 'package:my_app/theme/app_widgets/app_input_field.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        InputField(labelText: 'User Name',
        ),
        InputField(labelText: 'Password', placeholder: 'password', password: true ,

        ),
         
      ],)),
    );
  }
}