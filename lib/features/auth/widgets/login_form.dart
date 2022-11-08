import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/features/auth/providers/login_provider.dart';
import 'package:my_app/features/auth/widgets/question_button.dart';
import 'package:my_app/theme/app_widgets/app_button.dart';
import 'package:my_app/theme/app_widgets/app_input_field.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.read<LoginProvider>();
    print('building form');
    return Form(
      key: loginProvider.loginFormKey,
      child: Column(
        children: [
          InputField(
            validator: loginProvider.validateEmail,
            labelText: 'Email',
            inputType: TextInputType.emailAddress,
            inputAction: TextInputAction.next,
            controller: loginProvider.emailController,
          ),
          Selector<LoginProvider, bool>(
            builder: (context, value, child) => InputField(
              validator: loginProvider.validatePassword,
              labelText: 'Password',
              password: value,
              trailing: Icon(value ? Icons.visibility : Icons.visibility_off),
              trailingTapped: loginProvider.toggleObscure,
              inputAction: TextInputAction.done,
              controller: loginProvider.passwordController,
            ),
            selector: (context, provider) => provider.obscure,
          ),
          Selector<LoginProvider, bool>(
            builder: (context, value, child) {
              return MyButton(
                busy: loginProvider.isloading,
                title: 'Login',
                onTap: () {
                  loginProvider.loginUser(context);
                },
              );
            },
            selector: (p0, p1) => p1.isloading,
          ),
          QuestionButton(
                question: 'Don\'\t have an account?  ',
                action: 'Sign In',
                onTap: () {loginProvider.gotoSignupScreen(context);}, 
              )
        ],
      ),
    );
  }
}
