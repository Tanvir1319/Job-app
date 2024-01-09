import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/custom_outline_btn.dart';
import 'package:job_app/views/common/height_spacer.dart';
import 'package:job_app/views/common/reusable_text.dart';
import 'package:job_app/views/ui/auth/login.dart';
import 'package:job_app/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      color: Color(kLightBlue.value),
      child: Column(
        children: [
          Image.asset('assets/images/page3.png'),
          HeightSpacer(size: 20),
          ReusableText(
            text: 'Welcome to JOBAPP',
            style: appstyle(30, Color(kLight.value), FontWeight.w600),
          ),
          HeightSpacer(size: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "We help you find your job",
              style: appstyle(14, Color(kLight.value), FontWeight.normal),
            ),
          ),
          HeightSpacer(size: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomOutlineBtn(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('entrypoint', true);
                  Get.to(() => LoginPage());
                },
                text: 'Login',
                width: width * 0.4,
                height: hieght * 0.06,
                color: Color(kLight.value),
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => RegistrationPage()
                  );
                },
                child: Container(
                  width: width * 0.4,
                  height: hieght * 0.06,
                  color: Color(kLight.value),
                  child: Center(
                      child: ReusableText(
                          text: "Sign Up",
                          style: appstyle(
                              16, Color(kLightBlue.value), FontWeight.w600))),
                ),
              ),
            ],
          ),
          const HeightSpacer(size: 9),
          ReusableText(
            text: 'Continue as guest',
            style: appstyle(16, Color(kLight.value), FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
