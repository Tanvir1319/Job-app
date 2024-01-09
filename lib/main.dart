import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_app/constants/app_constants.dart';
import 'package:job_app/controllers/bookmark_provider.dart';
import 'package:job_app/controllers/login_provider.dart';
import 'package:job_app/controllers/signup_provider.dart';
import 'package:job_app/controllers/zoom_provider.dart';
import 'package:job_app/views/ui/auth/login.dart';
import 'package:job_app/views/ui/mainscreen.dart';

import 'package:job_app/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/onboarding_provider.dart';

Widget defaultHome = OnBoardingScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final entrypoint = prefs.getBool('entrypoint') ?? false;
  final loggedIn = prefs.getBool('loggedIn') ?? false;

  if (entrypoint & !loggedIn) {
    defaultHome = LoginPage();
  } else if (entrypoint & !loggedIn) {
    defaultHome = MainScreen();
  }

  runApp(
      //widget bindings++++ async
      //---->>>>                39 mins part 2
      MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => OnBoardNotifier(),
    ),
    ChangeNotifierProvider(create: (context) => LoginNotifier()),
    ChangeNotifierProvider(create: (context) => ZoomNotifier()),
    ChangeNotifierProvider(create: (context) => SignUpNotifier()),
    //ChangeNotifierProvider(create: (context) => JobsNotifier()),
    //ChangeNotifierProvider(create: (context) => BookMarkNotifier()),
    //ChangeNotifierProvider(create: (context) => ImageUpoader()),
    //ChangeNotifierProvider(create: (context) => ProfileNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'JOB APP',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(kLight.value),
              iconTheme: IconThemeData(color: Color(kDark.value)),
              primarySwatch: Colors.grey,
            ),
            home: defaultHome,
          );
        });
  }
}
