import 'package:flutter/material.dart';
import 'package:isnad/result/Resulit.dart';

import '../about_us/about_us.dart';
import '../king/king.dart';
import '../pages/news/news.dart';
import '../state/State.dart';
import '../web/webview1.dart';
import '../web/webview2.dart';

class Draweritems {
  String titled;
  String imagesd;
  Widget page; // Reference to the corresponding page

  Draweritems({
    required this.imagesd,
    required this.titled,
    required this.page, // Include the page parameter
  });

  static List<Draweritems> draweritems = [
    Draweritems(
      imagesd: 'assets/drawer/Address_Book.png',
      titled: 'تواصل معنا',
      page: const Aboutus(), // Include the Aboutus page
    ),
    Draweritems(
      imagesd: 'assets/drawer/Statistics.png',
      titled: 'تقارير و احصائيات',
      page: const States(), // Include the States page (adjust as needed)
    ),
    Draweritems(
      imagesd: 'assets/drawer/Footman.png',
      titled: 'فرسان الوطن',
      page: const King(), // Include the King page (adjust as needed)
    ),
    Draweritems(
      imagesd: 'assets/drawer/Vector.png',
      titled: 'اخبار اسناد',
      page: const News(), // Include the News page (adjust as needed)
    ),
    Draweritems(
      imagesd: 'assets/drawer/Task_Planning.png',
      titled: 'برنامج عمل الحكومة',
      page: const Webview1(), // Include the Webview1 page (adjust as needed)
    ),
    Draweritems(
      imagesd: 'assets/drawer/Innovation.png',
      titled: 'رؤية الكويت التنموية 2023',
      page: const Webview2(), // Include the Webview2 page (adjust as needed)
    ),
    Draweritems(
      imagesd: 'assets/drawer/Charity.png',
      titled: 'المبادرات',
      page: const Resulit(), // Include the States page (adjust as needed)
    ),
    Draweritems(
      imagesd: 'assets/drawer/About.png',
      titled: 'من نحن',
      page: const Aboutus(), // Include the Aboutus page (adjust as needed)
    ),
  ];
}
