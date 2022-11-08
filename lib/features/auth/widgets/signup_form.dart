import 'package:flutter/material.dart';
import 'package:my_app/features/auth/providers/signup_provider.dart';
import 'package:my_app/features/auth/widgets/question_button.dart';
import 'package:my_app/theme/app_widgets/app_button.dart';
import 'package:my_app/theme/app_widgets/app_input_field.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupProvider = context.read<SignUpProvider>();
    
    return Form(
      key: signupProvider.signUpFormKey,
      child: Column(
        children: [
          InputField(
            validator: signupProvider.validateEmail,
            labelText: 'Name',
            inputType: TextInputType.name,
            inputAction: TextInputAction.next,
            controller: signupProvider.nameController,
          ),
          InputField(
            validator: signupProvider.validateEmail,
            labelText: 'Email',
            inputType: TextInputType.emailAddress,
            inputAction: TextInputAction.next,
            controller: signupProvider.emailController,
          ),
          Selector<SignUpProvider, bool>(
            builder: (context, value, child) => InputField(
              validator: signupProvider.validatePassword,
              labelText: 'Password',
              password: value,
              trailing: Icon(value ? Icons.visibility : Icons.visibility_off),
              trailingTapped: signupProvider.toggleObscure, 
              inputAction: TextInputAction.done,
              controller: signupProvider.passwordController,
            ),
            selector: (context, provider) => provider.obscure,
          ),
          Selector<SignUpProvider, bool>(
            builder: (context, value, child) => InputField(
              validator: signupProvider.validateConfirmPassword,
              labelText: 'Confirm Password',
              password: value,
              trailing: Icon(value ? Icons.visibility : Icons.visibility_off),
              trailingTapped: signupProvider.toggleReObscure,
              inputAction: TextInputAction.done,
              controller: signupProvider.rePasswordController, 
            ),
            selector: (context, provider) => provider.reObscure,
          ),
         
          Selector<SignUpProvider, bool>(
            builder: (context, value, child) {
              return MyButton(
                busy: signupProvider.isloading,
                title: 'SignUp',
                onTap: () {
                  signupProvider.signupUser(context);
                },
              );
            },
            selector: (p0, p1) => p1.isloading,
          ),
             QuestionButton(
                question: 'Do you already have an account?  ',
                action: 'Login',
                onTap: () {
                  signupProvider.gotoLoginScreen(context);
                }, 
              )
        ],
      ),
    );
  }
}
