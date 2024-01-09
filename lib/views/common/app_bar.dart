import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.text, required this.child, this.actions});

  final String? text;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(),
      elevation: 0,
      backgroundColor: Color(kLight.value),
      leadingWidth: 70.w,
      automaticallyImplyLeading: false,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
          text: text?? "", style: appstyle(16, Color(kDark.value), FontWeight.w600)),
    );
  }
}
