import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_bar.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/drawer/drawer_widget.dart';
import 'package:job_app/views/common/height_spacer.dart';
import 'package:job_app/views/common/reusable_text.dart';
import 'package:job_app/views/common/width_spacer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Profile',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: DrawerWidget(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: hieght * 0.12,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          width: 80.w,
                          height: 100.h,
                          imageUrl: "https://via.placeholder.com/200x150",
                        ),
                      ),
                    ],
                  ),
                  WidthSpacer(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: 'John Doe',
                        style:
                            appstyle(20, Color(kDark.value), FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(
                            MaterialIcons.location_pin,
                            color: Color(kDarkGrey.value),
                          ),
                          WidthSpacer(width: 5),
                          ReusableText(
                            text: 'Dhaka',
                            style: appstyle(
                                16, Color(kDarkGrey.value), FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Icon(
                      Feather.edit,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  width: width,
                  height: hieght * 0.12,
                  color: Color(kLightGrey.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        width: 60.w,
                        height: 70.h,
                        color: Color(kLight.value),
                        child: Icon(
                          FontAwesome5Regular.file_pdf,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: "Resume From JobApp",
                            style: appstyle(
                                18, Color(kDark.value), FontWeight.w500),
                          ),
                          ReusableText(
                            text: "Resume ",
                            style: appstyle(
                                16, Color(kDarkGrey.value), FontWeight.w500),
                          ),
                        ],
                      ),
                      WidthSpacer(width: 1),
                    ],
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 5.w,
                  child: GestureDetector(
                    onTap: null,
                    child: ReusableText(
                      text: "Edit ",
                      style:
                          appstyle(16, Color(kOrange.value), FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              width: width,
              height: hieght * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                  text: "sample@sample.com",
                  style: appstyle(16, Color(kDark.value), FontWeight.w600),
                ),
              ),
            ),
            HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              width: width,
              height: hieght * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/usa.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                    WidthSpacer(width: 15),
                    ReusableText(
                      text: "+1111111111",
                      style: appstyle(16, Color(kDark.value), FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            HeightSpacer(size: 20),
            Container(
              color: Color(kLightGrey.value),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ReusableText(
                        text: "Skills",
                        style:
                            appstyle(16, Color(kDark.value), FontWeight.w600)),
                  ),
                  HeightSpacer(size: 3),
                  SizedBox(
                    height: hieght * 0.5,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: ListView.builder(
                            itemCount: skills.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final skill = skills[index];
                              return Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  width: width,
                                  height: hieght * 0.06,
                                  color: Color(kLight.value),
                                  child: ReusableText(
                                      text: skill,
                                      style: appstyle(16, Color(kDark.value),
                                          FontWeight.normal)),
                                ),
                              );
                            })),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
