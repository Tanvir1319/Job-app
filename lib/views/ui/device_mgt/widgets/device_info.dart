import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/custom_outline_btn.dart';
import 'package:job_app/views/common/height_spacer.dart';
import 'package:job_app/views/common/reusable_text.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key, required this.location, required this.device, required this.platform, required this.date, required this.ipAddress});
  final String location;
  final String device;
  final String platform;
  final String date;
  final String ipAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
        text: platform, 
        style: appstyle(22, Color(kDark.value), FontWeight.bold),
        ),
        ReusableText(
        text: device,  
        style: appstyle(22, Color(kDark.value), FontWeight.bold),
        ),
        HeightSpacer(size: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ReusableText(
        text: date, 
        style: appstyle(16, Color(kDarkGrey.value), FontWeight.w400),
        ),
          ReusableText(
        text: platform, 
        style: appstyle(16, Color(kDark.value), FontWeight.w400),
        ),

              ],
            ),
            CustomOutlineBtn(
              text: "Sign Out",
              color: Color(kOrange.value),
              height: hieght*0.05,
              width: width*0.3,
              ),
          ],
        ),
      ],
    );
  }
}