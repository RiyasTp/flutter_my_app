import 'package:flutter/material.dart';
import 'package:my_app/features/auth/models/login_model.dart';
import 'package:my_app/features/auth/models/signup_model.dart';
import 'package:my_app/features/auth/repo_services/auth_services.dart';
import 'package:my_app/features/auth/screens/login_screen.dart';
import 'package:my_app/features/home/screens/main_screen.dart';

class SignUpProvider extends ChangeNotifier {
  final signUpFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final _signUpServices = AuthServices();
  bool _isloading = false;
  bool obscure = true;
  bool reObscure = true;

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void toggleReObscure() {
    reObscure = !reObscure;
    notifyListeners();
  }

  bool get isloading => _isloading;

  void signupUser(BuildContext context) async {
    final navigator = Navigator.of(context);
    if (_isloading) return;
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }
    final data = SignUpData(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    _isloading = true;
    notifyListeners();
    final user = await _signUpServices.signUp(data);
    _isloading = false;
    notifyListeners();
    if (user != null) {
      navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (Route<dynamic> route) => false);
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your name';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Pleas enter a password';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty || value != passwordController.text) {
      return 'Password dose not match';
    }
    return null;
  }

  void gotoLoginScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
