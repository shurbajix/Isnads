import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/Event/Event_Details.dart';
import 'package:isnad/Home/showhome.dart';
import 'package:isnad/drawer/drawer.dart';
import 'package:isnad/notfication/notfication.dart';
import 'package:isnad/pages/profile/addinitiative.dart';
import 'package:isnad/teams/edit_team.dart';
import 'package:isnad/util/utilhome.dart';

import '../Event/event_edit.dart';
import '../initiative/initative.dart';
import '../navbar/Navbar.dart';
import '../pages/calendar/calendar.dart';
import '../pages/location/location.dart';
import '../pages/news/news.dart';
import '../pages/profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int? _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double? coverHeight = 200.h;
  double? profileHeight = 60.h;
  bool isFirstButtonSelected = false;
  bool isSecondButtonSelected = false;
  double? height, width;
  @override
  Widget build(BuildContext context) {
    // add the container

    //
    int? selectedIndex = 0;
    int? selectedIndexed = -1;
    void onItemTapped(int index) {
      // Check if the selected index is already the Home screen
      if (selectedIndex == 2) {
        return;
      }

      setState(() {
        selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const News()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Calendar()),
          );
          break;
        case 2:
          // Check if already on the Home screen, and skip navigation if true
          if (selectedIndex != 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          }
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Location()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Profile()),
          );
          break;
      }
    }

// container pageview for the first container
    final PageController pageController = PageController();
    int currentPageIndex = 1;
    final List<String> textData = [
      'المحيطة بك',
      'تعرف علي كل الفعاليات',
      // Add more Arabic text for additional pages if needed
      'المحيطة بك',
    ];

    Timer? timer;

    @override
    void initState() {
      super.initState();
      pageController.addListener(() {
        setState(() {
          currentPageIndex = pageController.page?.round() ?? 0;
        });
      });

      // Start the autoplay
    }

    @override
    void dispose() {
      // Cancel the timer when the widget is disposed
      timer!.cancel();
      pageController.dispose();
      super.dispose();
    }

    void startAutoplay() {
      const Duration autoplayDuration = Duration(
        seconds: 5,
      );

      // Autoplay logic
      timer = Timer.periodic(
        autoplayDuration,
        (Timer timer) {
          if (currentPageIndex < textData.length - 1) {
            pageController.animateToPage(currentPageIndex + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          } else {
            pageController.animateToPage(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          }
        },
      );
    }

// here for add the full information for home page
    List<Widget> currentList = isFirstButtonSelected
        ? []
        : List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 332.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/close.png',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/bookmark.png',
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0.3,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const AutoSizeText(
                                'مبادرة مؤسسة الخير',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff060518),
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                              const AutoSizeText(
                                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من",
                                textAlign: TextAlign.end,
                                maxLines: null,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 80.41.w,
                                    height: 20.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        backgroundColor:
                                            const Color(0xff00BF4D),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Event_Details(),
                                          ),
                                        );
                                      },
                                      child: const AutoSizeText(
                                        'اشتراك',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Add some spacing

                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          '1 مايو 2023 3 عصرا',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontFamily: 'NotoKufiArabic',
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.calendar_month_rounded,
                                          color: Color(0xff455727),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/meeting.png',
                        scale: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const Drawerlist(),
      bottomNavigationBar: NavBar(
        onItemTapped: onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250, // Set a fixed height for the Stack
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 179.h,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff455727),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 60,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Notifcation(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                            Builder(
                              builder: (context) => IconButton(
                                onPressed: () {
                                  if (_scaffoldKey.currentState != null) {
                                    _scaffoldKey.currentState!.openEndDrawer();
                                  }
                                },
                                icon: Image.asset(
                                  'assets/images/Menu.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top:
                        110, // Adjust the top value to position it below the first Positioned widget
                    left: 30,
                    child: Container(
                      height: 129,
                      width: 338,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/homeImage.png',
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Flexible(
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: textData.length,
                              itemBuilder: (context, index) {
                                return buildTextPage(
                                  textData[index],
                                  index,
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              textData.length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      pageController.jumpToPage(index);
                                    },
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: currentPageIndex == index
                                          ? Colors.white
                                          : const Color(0xffAE9E9E),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                reverse: true, // Set this to true for right-to-left scrolling
                scrollDirection: Axis.horizontal,
                itemCount: titlehome.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex;
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 2,
                      bottom: 2,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIndex = -1; // Deselect if already selected
                          } else {
                            selectedIndex = index;
                          }
                        });
                      },
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: isSelected
                              ? const Color(0xff6E9033)
                              : Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 5,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      imagesdhome[index],
                                      scale: isSelected ? 1.2 : 0.9,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          titlehome[index],
                                          style: TextStyle(
                                            fontFamily: 'NotoKufiArabic',
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: isSelected ? 16 : 14,
                                          ),
                                        ),
                                        Text(
                                          subtitlehome[index],
                                          style: TextStyle(
                                            fontFamily: 'NotoKufiArabic',
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: isSelected ? 16 : 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowHome(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      'assets/images/Vectorgo.png',
                    ),
                    label: const Text(
                      'مشاهدة الكل',
                      style: TextStyle(
                        color: Color(0xff747688),
                        fontSize: 12,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ),
                  const Text(
                    'مبادرات قادمة',
                    style: TextStyle(
                      color: Color(0xff120D26),
                      fontSize: 20,
                      fontFamily: 'NotoKufiArabic',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(currentList.length, (index) {
                return currentList[index];
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextPage(String text, int index) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 100,
          top: 20,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "تعرف علي كل الفعاليات",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
                Text(
                  "المحيطة بك",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Widget> _pages = <Widget>[
  const addinitiative(),
  const Calendar(),
  const Home(),
  const Location(),
  const Profile(),
];
final List<String> titlehome = [
  'نهضة',
  'فعاليات',
  'فعاليات',
  'فعاليات',
];
final List<String> subtitlehome = [
  'المجتمع',
  'رياضية',
  'اجتماعية',
  'ثقافية',
];
final List imagesdhome = [
  'assets/images/vectors/vector.png',
  'assets/images/vectors/vector1.png',
  'assets/images/vectors/vector2.png',
  'assets/images/vectors/vector3.png',
];
// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             //width: 390.w,
//             height: coverHeight,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(50),
//                 bottomRight: Radius.circular(50),
//               ),
//               color: Color(0xff455727),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 top: 40,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const Notifcation(),
//                             ),
//                           );
//                         },
//                         icon: const Icon(
//                           Icons.notifications,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Builder(
//                         builder: (context) => IconButton(
//                           onPressed: () {
//                             if (_scaffoldKey.currentState != null) {
//                               _scaffoldKey.currentState!.openEndDrawer();
//                             }
//                           },
//                           icon: Image.asset(
//                             'assets/images/Menu.png',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     width: 338,
//                     height: 129,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       image: const DecorationImage(
//                         image: AssetImage(
//                           'assets/images/homeImage.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: currentList.length,
//               itemBuilder: (context, index) {
//                 return currentList[index];
//               },
//             ),
//           ),
//           Flexible(
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return SizedBox(
//                   width: 97.w,
//                   height: 39.h,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               "نهضة المجتمع",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
