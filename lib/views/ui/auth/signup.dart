import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/controllers/login_provider.dart';
import 'package:job_app/controllers/signup_provider.dart';

import 'package:job_app/views/common/app_bar.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/custom_btn.dart';
import 'package:job_app/views/common/custom_textfield.dart';
import 'package:job_app/views/common/height_spacer.dart';
import 'package:job_app/views/common/reusable_text.dart';
import 'package:job_app/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Consumer<SignUpNotifier>(
      builder: (context, signUpNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: "Sign Up",
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_left),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeightSpacer(
                  size: 50,
                ),
                ReusableText(
                  text: "Hello Welcome",
                  style: appstyle(30, Color(kDark.value), FontWeight.w600),
                ),
                ReusableText(
                  text: "Fill the details to sign up",
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600),
                ),
                HeightSpacer(size: 50),
                CustomTextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  hintText: "Full Name",
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Please enter a valid name";
                    } else {
                      return null;
                    }
                  },
                ),
                HeightSpacer(size: 20),
                CustomTextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  validator: (email) {
                    if (email!.isEmpty || !email.contains("@")) {
                      return "Please enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
                HeightSpacer(size: 20),
                CustomTextField(
                  controller: password,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Password",
                  //obscureText: SignUpNotifier,
                  validator: (password) {
                    if (signUpNotifier.passwordValidator(password ?? "")) {
                      return 'Please enter a valid password with at least one uppercase letter,one lowercase letter,one didit,one special character and length of 8 characters';
                    }
                    return null;
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // SignUpNotifier.obsecure = !SignUpNotifier.;
                    },
                    child: Icon(
                      Icons.visibility,
                      color: Color(kDark.value),
                    ),
                  ),
                ),
                HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => LoginPage());
                    },
                    child: ReusableText(
                        text: "Login",
                        style:
                            appstyle(14, Color(kDark.value), FontWeight.w500)),
                  ),
                ),
                HeightSpacer(size: 50),
                CustomButton(
                  text: "Sign Up",
                  onTap: () {
                    loginNotifier.firstTime = !loginNotifier.firstTime;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
