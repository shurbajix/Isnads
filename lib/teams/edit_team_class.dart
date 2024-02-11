import 'package:flutter/material.dart';

class EditTeams {
  String? title;
  String? iconsteam;

  EditTeams({
    required this.iconsteam,
    required this.title,
  });
  static List<EditTeams> itemsTeam = [
    EditTeams(
      iconsteam: 'assets/images/rigester/Profile.png',
      title: "اسم الفريق",
    ),
    EditTeams(
      iconsteam: 'assets/images/rigester/info.png',
      title: 'تفاصيل الفريق',
    ),
    EditTeams(
      iconsteam: 'assets/images/rigester/people.png',
      title: "اضافة اعضاء",
    ),
  ];
}
