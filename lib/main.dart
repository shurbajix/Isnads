import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/Event/Event_Details.dart';
import 'package:isnad/Home/Home.dart';

import 'package:isnad/king/king.dart';
import 'package:isnad/obsscreen/Splash%20Screen.dart';
import 'package:isnad/obsscreen/obcscreen.dart';
import 'package:isnad/pages/news/news.dart';
import 'package:isnad/pages/profile/profile.dart';
import 'package:isnad/pages/profile/profile_edit.dart';
import 'package:isnad/spalsh/splash.dart';
import 'package:isnad/state/State.dart';

import 'util/Responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          routes: {
            '/': (context) => const Spalsh(),
            '/Obsscreen': (context) => const Obsscreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
