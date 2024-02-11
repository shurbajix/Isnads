import 'package:flutter/material.dart';

class Eventdetails {
  final String iconAssetPath; // Change the type to String
  final String texted;
  final String descrption;

  Eventdetails({
    required this.descrption,
    required this.iconAssetPath, // Change the type to String
    required this.texted,
  });

  static List<Eventdetails> eventdetail = [
    Eventdetails(
      descrption: 'الثلاثاء , الساعة ال 4 عصرا ',
      iconAssetPath: 'assets/images/calendar.png', // Store the asset path
      texted: '14 من ديسمبر 2023',
    ),
    Eventdetails(
      descrption: "هنا يكتب العنوان تفصيليا",
      iconAssetPath: 'assets/images/locations.png', // Store the asset path
      texted: 'ارض المعارض',
    ),
    Eventdetails(
      descrption: 'المنظم',
      iconAssetPath: 'assets/images/arab.png', // Store the asset path
      texted: 'عمرو طارق',
    ),
  ];
}
