import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/controllers/login_provider.dart';
import 'package:job_app/views/common/app_bar.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/drawer/drawer_widget.dart';
import 'package:job_app/views/common/exports.dart';
import 'package:job_app/views/common/height_spacer.dart';
import 'package:job_app/views/common/reusable_text.dart';
import 'package:job_app/views/ui/device_mgt/widgets/device_info.dart';
import 'package:job_app/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardNotifier>(context);
    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Device Management',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeightSpacer(size: 50),
                  Text(
                    "You are logged in your account from these devices ",
                    style: appstyle(16, Color(kDark.value), FontWeight.normal),
                  ),
                  HeightSpacer(size: 50),
                  DeviceInfo(
                    location: "loloo",
                    date: loginDate,
                    device: "ABC",
                    platform: "1111",
                    ipAddress: "qqqq",
                  ),
                  HeightSpacer(size: 50),
                  DeviceInfo(
                    location: "loloo1111",
                    date: loginDate,
                    device: "ABCwd",
                    platform: "1111rt",
                    ipAddress: "qqqqrgdd",
                  ),
                ],
              ),
            ),
            Consumer<LoginNotifier>(
              builder: (context, loginNotifier, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      onBoardNotifier.isLastPage = false;
                      zoomNotifier.currentIndex = 0;
                      Get.to(() => OnBoardingScreen());
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ReusableText(
                          text: "Sign out of all devices",
                          style: appstyle(
                              16, Color(kOrange.value), FontWeight.w600)),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
