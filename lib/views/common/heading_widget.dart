import 'package:flutter/material.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/reusable_text.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.text, required this.text1, this.onTap});

  final String text;
  final String text1;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
          text: text,
          style: appstyle(20, Color(kDark.value), FontWeight.w600),
        ),
        GestureDetector(
          onTap: onTap,
          child: ReusableText(
            text: text1,
            style: appstyle(15, Color(kOrange.value), FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
