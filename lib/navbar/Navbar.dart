import 'package:flutter/material.dart';
import 'package:isnad/Home/Home.dart';
import 'package:isnad/pages/calendar/calendar.dart';
import 'package:isnad/pages/location/location.dart';
import 'package:isnad/pages/news/news.dart';
import 'package:isnad/pages/profile/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.onItemTapped});

  final Function(int) onItemTapped;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: const Color(0xff2C3550),
      unselectedItemColor: const Color(0xff2C3550),
      selectedLabelStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xffDADADA),
        fontFamily: 'NotoKufiArabic',
      ),
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onItemTapped(index);
      },
      //backgroundColor: Colors.transparent,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/bottomnavbar/news.png',
          ),
          label: 'الاخبار',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/bottomnavbar/Calendar.png',
            color: const Color(0xffDADADA),
          ),
          label: 'المبادرات',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xff455727),
            child: Image.asset(
              'assets/images/bottomnavbar/home.png',
            ),
          ), // Empty container for the space of the CircleAvatar
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/bottomnavbar/location.png',
            color: const Color(0xffDADADA),
          ),
          label: 'الخريطة',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/bottomnavbar/profile.png',
            color: const Color(0xffDADADA),
          ),
          label: 'ملفي',
        ),
      ],
    );
  }
}
