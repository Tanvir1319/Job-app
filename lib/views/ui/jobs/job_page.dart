import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_bar.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/custom_outline_btn.dart';
import 'package:job_app/views/common/height_spacer.dart';
import 'package:job_app/views/common/reusable_text.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          text: widget.title,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Entypo.bookmark),
            ),
          ],
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(CupertinoIcons.arrow_left),
          ),
        ),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                HeightSpacer(
                  size: 30,
                ),
                Container(
                  width: width,
                  height: hieght * 0.27,
                  color: Color(kLightGrey.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      HeightSpacer(size: 10),
                      ReusableText(
                        text: "Senior Flutter Developer",
                        style:
                            appstyle(22, Color(kDark.value), FontWeight.w600),
                      ),
                      HeightSpacer(size: 5),
                      ReusableText(
                        text: "Dhaka",
                        style: appstyle(
                            16, Color(kDarkGrey.value), FontWeight.normal),
                      ),
                      HeightSpacer(size: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                              width: width * 0.26,
                              height: hieght * 0.04,
                              color2: Color(kLight.value),
                              text: "Full-Time",
                              color: Color(kOrange.value),
                              onTap: null,
                            ),
                            Row(
                              children: [
                                ReusableText(
                                    text: "10k",
                                    style: appstyle(22, Color(kDark.value),
                                        FontWeight.w600)),
                                SizedBox(
                                  width: width * 0.2,
                                  child: ReusableText(
                                      text: "/monthly",
                                      style: appstyle(22, Color(kDark.value),
                                          FontWeight.w600)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                HeightSpacer(size: 20),
                ReusableText(
                  text: "Job Description",
                  style: appstyle(22, Color(kDark.value), FontWeight.w600),
                ),
                HeightSpacer(size: 20),
                Text(
                  desc,
                  maxLines: 8,
                  style:
                      appstyle(16, Color(kDarkGrey.value), FontWeight.normal),
                ),
                HeightSpacer(size: 20),
                ReusableText(
                  text: "Reqirements",
                  style: appstyle(22, Color(kDark.value), FontWeight.w600),
                ),
                HeightSpacer(
                  size: 10,
                ),
                SizedBox(
                  height: hieght * 0.6,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: requirements.length,
                      itemBuilder: (context, index) {
                        final req = requirements[index];
                        String bullet = '\u2022';
                        return Text(
                          "$bullet $req\n",
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: appstyle(
                              16, Color(kDarkGrey.value), FontWeight.normal),
                        );
                      }
                      ),
                ),
                HeightSpacer(size: 20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: CustomOutlineBtn(
                  text: 'Apply Mow',
                  width: width,
                  color: Color(kLight.value),
                  height: hieght*.06,
                  color2: Color(kOrange.value) ,

                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
