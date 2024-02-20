import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/Event/event_edit.dart';
import 'package:isnad/pages/profile/class_profile.dart';
import 'package:isnad/pages/profile/profile_edit.dart';
import 'package:http/http.dart' as http;
import '../../teams/all_Teams.dart';
import '../../teams/edit_team.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, bool? success, Data? data, String? message});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String description =
      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل";
  final String textbutton = "";
  bool isReadMore = false;
  bool isFirstButtonSelected = true;
  bool isSecondButtonSelected = false;
  final Profile profile = Profile(
    success: true,
    data: Data(
      fullName: 'full_name', // Change this to the full name received from API
    ),
    message: 'Profile fetched successfully',
  );
  late Future<Data> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = fetchProfileData();
  }

  Future<Data> fetchProfileData() async {
    final response =
        await http.get(Uri.parse('https://isnad.gavakw.com/api/user/profile'));
    if (response.statusCode == 200) {
      return Data.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxline = isReadMore ? null : 5;
    final overflow = isReadMore ? TextOverflow.values : TextOverflow.ellipsis;
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
                                //profile.data['full_name'].toString(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 80.41.w,
                                    height: 24.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        backgroundColor:
                                            const Color(0xff00BF4D),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Text(
            'ملفي',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontFamily: 'NotoKufiArabic',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder<Data>(
        future: _profileData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Data profileData = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileData.image ?? ''),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    profileData.fullName ?? '',
                    style: const TextStyle(
                      color: Color(0xff120D26),
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'NotoKufiArabic',
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '350',
                            style: TextStyle(
                              color: const Color(0xff120D26),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            'متابعة',
                            style: TextStyle(
                              color: const Color(0xff747688),
                              fontSize: 14.sp,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      const VerticalDivider(
                        endIndent: 3,
                        indent: 3,
                        thickness: 5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Column(
                        children: [
                          Text(
                            '346',
                            style: TextStyle(
                              color: const Color(0xff120D26),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            'متابعون',
                            style: TextStyle(
                              color: const Color(0xff747688),
                              fontSize: 14.sp,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile_Edit(),
                        ),
                      );
                    },
                    child: Container(
                      width: 127.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xff6E9033),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'تعديل',
                            style: TextStyle(
                              color: const Color(0xff455727),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                          Image.asset(
                            'assets/images/edit.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'بيانات شخصية',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontFamily: 'NotoKufiArabic',
                    ),
                  ),
                  Text(
                    isReadMore ? description : description.substring(0, 40),
                    textAlign: TextAlign.center,
                    maxLines: maxline,
                    style: TextStyle(
                      color: const Color(0xff3C3E56),
                      fontSize: 14.sp,
                      fontFamily: 'NotoKufiArabic',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isReadMore = isReadMore;
                      });
                    },
                    icon: Icon(
                      isReadMore ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: const Color(
                        0xff5669FF,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        String buttonText = index == 0
                            ? 'اضافة مبادرة جديدة'
                            : "عرض جميع المبادرات";
                        String buttonimage = index == 0
                            ? 'assets/images/plus.png'
                            : 'assets/images/up.png';
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
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 20,
                              ),
                              child: SizedBox(
                                width: 319.w,
                                height: 58,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: const Color(0xff455727),
                                  ),
                                  onPressed: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Editteam(),
                                        ),
                                      );
                                    } else if (index == 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const All_Teams(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xff6E9033),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              buttonimage,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        buttonText,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget buildButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFirstButtonSelected = text == 'السابقة';
          isSecondButtonSelected = text == 'القادمة';
        });
      },
      child: SizedBox(
        width: 140,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.white : Colors.transparent,
            shadowColor: isSelected ? Colors.white : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xff5669FF)
                  : const Color(0xff9B9B9B),
              fontSize: 16,
              fontFamily: 'NotoKufiArabic',
            ),
          ),
        ),
      ),
    );
  }
}


// showModalBottomSheet<dynamic>(
//                                     isScrollControlled: true,
//                                     backgroundColor: Colors.white,
//                                     context: context,
//                                     builder: (
//                                       BuildContext context,
//                                     ) {
//                                       return SizedBox(
//                                         height: 650.h,
//                                         child: Center(
//                                           child: Column(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(10.0),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     IconButton(
//                                                       onPressed: () {
//                                                         Navigator.pop(context);
//                                                       },
//                                                       icon: const Icon(
//                                                         Icons.close,
//                                                       ),
//                                                     ),
//                                                     Text(
//                                                       'مبادراتي',
//                                                       style: TextStyle(
//                                                         color: const Color(
//                                                             0xff120D26),
//                                                         fontSize: 24.sp,
//                                                         fontFamily:
//                                                             'NotoKufiArabic',
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Container(
//                                                 width: 290.w,
//                                                 height: 45.06.h,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           100),
//                                                   color: const Color(
//                                                     0xff07000000,
//                                                   ),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceAround,
//                                                   children: [
//                                                     buildButton('السابقة',
//                                                         isFirstButtonSelected),
//                                                     buildButton('القادمة',
//                                                         isSecondButtonSelected),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: ListView.builder(
//                                                   shrinkWrap: true,
//                                                   scrollDirection:
//                                                       Axis.vertical,
//                                                   itemCount: currentList.length,
//                                                   itemBuilder:
//                                                       (context, index) {
//                                                     return currentList[index];
//                                                   },
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   bottom: 40,
//                                                 ),
//                                                 child: SizedBox(
//                                                   width: 319.w,
//                                                   height: 58.h,
//                                                   child: ElevatedButton(
//                                                     style: ElevatedButton
//                                                         .styleFrom(
//                                                       backgroundColor:
//                                                           const Color(
//                                                               0xff455727),
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                           15,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     onPressed: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               const Event_edit(),
//                                                         ),
//                                                       );
//                                                     },
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                           width: 30,
//                                                           height: 30,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         20),
//                                                             color: const Color(
//                                                                 0xff6E9033),
//                                                             image:
//                                                                 const DecorationImage(
//                                                               image: AssetImage(
//                                                                 'assets/images/plus.png',
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 20.w,
//                                                         ),
//                                                         const Text(
//                                                           'اضافة مبادرة جديدة',
//                                                           style: TextStyle(
//                                                             color: Color(
//                                                               0xffFFFFFF,
//                                                             ),
//                                                             fontSize: 24,
//                                                             fontFamily:
//                                                                 'NotoKufiArabic',
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     });
//                               }