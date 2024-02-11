import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/Event/Event_Details.dart';

class ShowHome extends StatefulWidget {
  const ShowHome({super.key});

  @override
  State<ShowHome> createState() => _ShowHomeState();
}

bool isFirstButtonSelected = false;
bool isSecondButtonSelected = false;

class _ShowHomeState extends State<ShowHome> {
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
  void navigateToEventDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Event_Details()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Text(
            'مبادرات قادمة',
            style: TextStyle(
              color: Color(0xff120D26),
              fontSize: 20,
              fontFamily: 'NotoKufiArabic',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: currentList.length,
        itemBuilder: (context, index) {
          return currentList[index];
        },
      ),
    );
  }
}
