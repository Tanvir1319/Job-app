import 'package:flutter/material.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.color, this.onTap});

  final String text;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          color: Color(kOrange.value),
          width: width,
          height: hieght * 0.065,
          child: Center(
            child: ReusableText(
                text: text,
                style: appstyle(
                    16, color ?? Color(kLight.value), FontWeight.w600)),
          ),
        ));
  }
}
