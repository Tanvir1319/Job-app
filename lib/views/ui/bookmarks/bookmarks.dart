import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/views/common/app_bar.dart';
import 'package:job_app/views/common/drawer/drawer_widget.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          
          text: 'Bookmarks',
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: DrawerWidget(),
            ),
          
          ),
        ),
    );
  }
}