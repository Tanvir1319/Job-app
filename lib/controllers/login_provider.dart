import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/models/request/auth/login_model.dart';
import 'package:job_app/services/helpers/auth_helper.dart';
import 'package:job_app/views/ui/auth/update_user.dart';
import 'package:job_app/views/ui/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
  final loginFormKey = GlobalKey<FormState>();
  bool get obscureText => _obscureText;
  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  //login first time
  bool _firstTime = true;
  bool get firstTime => _firstTime;
  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }

  //entrypoint
  bool? _entrypoint;

  bool get entrypoint => _entrypoint ?? false;
  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  //logged in
  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;
  set loggedIn(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }



 bool validateAndSave() {
    final form = loginFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }







  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    entrypoint = prefs.getBool("entrypoint") ?? false;
    loggedIn = prefs.getBool("loggedIn") ?? false;
  }

  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response && firstTime) {
        Get.off(() => PersonalDetails());
      } else if (response && !firstTime) {
        Get.off(() => MainScreen());
      } else if (!response) {
        Get.snackbar("Sign Failed", "Please check your credentials",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: Icon(Icons.add_alert));
      }
    });
  }

  //logout function
  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    await prefs.remove('token');
    _firstTime = false;
  }
}
