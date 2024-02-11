import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/drawer/drawer_class.dart';
import 'package:isnad/pages/profile/profile.dart';

import '../pages/profile/addinitiative.dart';

class Drawerlist extends StatefulWidget {
  const Drawerlist({super.key});

  @override
  State<Drawerlist> createState() => _DrawerlistState();
}

bool isFirstButtonSelected = false;
bool isSecondButtonSelected = false;

class _DrawerlistState extends State<Drawerlist> {
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
                        horizontal: 0.2,
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
                              maxLines: 4,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoKufiArabic',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 80.41.w,
                                  height: 24.h,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      backgroundColor: const Color(0xff00BF4D),
                                    ),
                                    onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/closed.png',
                  color: const Color(0xff001517),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/images/arab.png',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'اسم المستخدم',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
            reverse: true,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: Draweritems.draweritems.length,
            itemBuilder: (context, index) {
              return LayoutBuilder(
                builder: (_, c) {
                  final width = c.maxWidth;
                  var fontSize = 16.0;
                  if (width <= 480) {
                    fontSize = 16.0;
                  } else if (width > 480 && width <= 960) {
                    fontSize = 22.0;
                  } else {
                    fontSize = 28.0;
                  }
                  return ListTile(
                    onTap: () {
                      if (Draweritems.draweritems[index].titled ==
                          'المبادرات') {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 750,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'مبادراتي',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'NotoKufiArabic',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 290.w,
                                      height: 45.06.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: const Color(0xff07000000),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: 140.w,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isFirstButtonSelected = true;
                                                  isSecondButtonSelected =
                                                      false;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    isFirstButtonSelected
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                shadowColor:
                                                    isFirstButtonSelected
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              child: Text(
                                                'السابقة',
                                                style: TextStyle(
                                                  color: isFirstButtonSelected
                                                      ? const Color(0xff455727)
                                                      : const Color(0xff9B9B9B),
                                                  fontSize: 16,
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 140.w,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isFirstButtonSelected = false;
                                                  isSecondButtonSelected = true;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    isSecondButtonSelected
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                shadowColor:
                                                    isSecondButtonSelected
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              child: Text(
                                                'القادمة',
                                                style: TextStyle(
                                                  color: isSecondButtonSelected
                                                      ? const Color(0xff455727)
                                                      : const Color(0xff9B9B9B),
                                                  fontSize: 16,
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: currentList.length,
                                        itemBuilder: (context, index) {
                                          return currentList[index];
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 20,
                                        top: 20,
                                      ),
                                      child: SizedBox(
                                        width: 319,
                                        height: 58,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            backgroundColor:
                                                const Color(0xff455727),
                                            shadowColor:
                                                const Color(0xff455727),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const addinitiative(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/images/add.png',
                                              ),
                                              const Text(
                                                'اضافة مبادرة جديدة',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        // Navigate to the respective page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Draweritems.draweritems[index].page,
                          ),
                        );
                      }
                    },
                    contentPadding: const EdgeInsets.only(left: 16),
                    title: Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Add your desired icon here
                              // Adjust the spacing between icon and text
                              Text(
                                Draweritems.draweritems[index].titled,
                                style: const TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),

                              Image.asset(
                                Draweritems.draweritems[index].imagesd,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              'اسناد 2024 جميع الحقوق محفوظة',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff808080),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'NotoKufiArabic',
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Center(
            child: Text(
              "powered by - Gavan Tech",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff808080),
                fontFamily: 'NotoKufiArabic',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
