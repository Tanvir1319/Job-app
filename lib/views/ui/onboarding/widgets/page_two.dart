import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/height_spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            HeightSpacer(size: 65),
            Padding(padding: EdgeInsets.all(8.h),
            child: Image.asset("assets/images/page2.png"),
           
            ),
            HeightSpacer(size:20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Stable Yourself \n With your skill",
                textAlign: TextAlign.center,
                style: appstyle(30, Color(kLight.value), FontWeight.w500),
                
                ),
                HeightSpacer(size: 10),
                Padding(padding: EdgeInsets.all(8.h),
                child: Text('We help you to find your dream job',
                textAlign: TextAlign.center,
                style: appstyle(14, Color(kLight.value), FontWeight.normal),),
                ),
                
              ],
            ),
          ],
        ),
      ),
      );
  }
}