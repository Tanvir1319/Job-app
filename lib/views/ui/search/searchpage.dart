import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/views/common/app_style.dart';
import 'package:job_app/views/common/custom_textfield.dart';
import 'package:job_app/views/common/height_spacer.dart';
import 'package:job_app/views/common/reusable_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(
          color: Color(kLight.value),
        ),
        title: CustomTextField(
          hintText: "Search For Jobs",
          controller: search,
          suffixIcon: GestureDetector(
            onTap: (){},
            child: Icon(AntDesign.search1),
          ),

        ),
        elevation: 0,
      ),
    body: Center(
      child: Padding(
      padding: EdgeInsets.all(40.h),
      child:  Column(
        children: [
          SizedBox(
            height: 190.h,
          ),
          Image.asset("assets/images/optimized_search.png"),
          HeightSpacer(size: 30),
          ReusableText(
          text: 'Search For Jobs',
           style: appstyle(30, Color(kDark.value), FontWeight.bold),
           ),
        ],
      ),
      ),
      
    ),
    );
  }
}
