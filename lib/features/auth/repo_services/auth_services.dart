import 'package:my_app/features/auth/models/login_model.dart';
import 'package:my_app/features/auth/models/signup_model.dart';
import 'package:my_app/features/auth/models/user_auth_model.dart';
import 'package:my_app/utils/secure_storage/secured_storage_services.dart';

class AuthServices {
  //to singleton
  static final AuthServices _singleton = AuthServices._internal();
  factory AuthServices() {
    return _singleton;
  }
  AuthServices._internal();



  Future<User?> login(LoginData credentials) async {
    await Future.delayed(const Duration(seconds: 3), () {
      // <-- Delay here
    });

    if (credentials.email == 'riyastp04@gmail.com' &&
        credentials.password == '1234') {
      return User(
          token: 'riyas',
          name: 'riyas',
          email: credentials.email,
          refreshToken: 'refreshToken');
    }
    return null;
  }

  Future<User?> signUp(SignUpData details) async{
    await Future.delayed(const Duration(seconds: 3), () {
      // <-- Delay here
    });

    return User(
        token: 'token',
        name: details.name,
        email: 'email',
        refreshToken: 'refreshToken');
  }

  Future<User?> checkLogined() async{
    final token = await SecuredStorage().read('token');
    if(token==null) return null;
    if(token=='riyas'){
      return User(
          token: 'riyas',
          name: 'riyas',
          email: 'riyastp04@gmail.com',
          refreshToken: 'refreshToken');
    }
    return null;
  }

  logOut() {}

 
 
}
