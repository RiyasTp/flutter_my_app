import 'package:flutter/material.dart';
import 'package:my_app/features/auth/models/login_model.dart';
import 'package:my_app/features/auth/repo_services/auth_services.dart';
import 'package:my_app/features/auth/screens/login_screen.dart';
import 'package:my_app/features/auth/screens/signup_screen.dart';
import 'package:my_app/features/home/screens/main_screen.dart';
import 'package:my_app/utils/extensions/string_extensions.dart';

class LoginProvider extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginServices = AuthServices();
  bool obscure = true;
  bool _isloading = false;

  bool get isloading => _isloading;

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void loginUser(BuildContext context) async {
    final navigator = Navigator.of(context);
    if (_isloading) return;
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    final data = LoginData(
      email: emailController.text,
      password: passwordController.text,
    );
    _isloading = true;
    notifyListeners();
    final user = await _loginServices.login(data);
    _isloading = false;
    notifyListeners();
    if(user!=null){
      navigator.pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()));
    }

  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter Email';
    if(!value.isEmail) return 'Please enter a valid email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Enter password';
    if(!value.isBetween(6, 20)) return 'Password must be 6-20 characters';
    return null;
  }

  void isAlreadyLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
    return;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  void gotoSignupScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ));
  }
}
