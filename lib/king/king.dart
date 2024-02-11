import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class King extends StatefulWidget {
  const King({super.key});

  @override
  State<King> createState() => _KingState();
}

class _KingState extends State<King> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Medal.png',
                    scale: 1.12,
                  ),
                  Row(
                    children: [
                      const Text(
                        'فرسان الوطن',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'NotoKufiArabic',
                          fontWeight: FontWeight.w500,
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
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'قائمة بكل من فازوا بجائزة فرسان الوطن',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'NotoKufiArabic',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: AlertDialog(
                              titlePadding: const EdgeInsets.only(
                                left: 40,
                              ),
                              iconPadding: const EdgeInsets.only(
                                right: 290,
                              ),
                              insetPadding: const EdgeInsets.only(
                                bottom: 350,
                              ),
                              backgroundColor: Colors.white,
                              content: const Text(
                                'اي مبادرة من المواطنين او مؤسسات المجتمع الوطني او القطاع الخاص تنال اكثر من 1000 اعجاب في التطبيق سيتم تقديم شهادة فارس الوطن " باسم كل شخص في الفريق للافراد او باسم مؤسسة المجتمع المدني او الشركات الخاصة ترسل لهم بالواتس اب حتي يقوموا بطابعتها',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NotoKufiArabic',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              title: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 50,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'الشروط',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'NotoKufiArabic',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "تعرف علي شروط الحصول علي الشهادة",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w300,
                        color: Color(0xff3658C1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Container(
                  width: 322.w,
                  height: 550,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
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
                          return Column(
                            //crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/images/Golden.png',
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'احمد محمد',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 147, 139, 139),
                                          fontSize: 16,
                                          fontFamily: 'NotoKufiArabic',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Text(
                                        'اسم المبادرة',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily: 'NotoKufiArabic',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const Text(
                                        "هنا تفاصيل عن المبادرة و المشتركين فيها ",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: const Text('180'),
                                            label: Image.asset(
                                              'assets/images/Following.png',
                                            ),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: const Text('180'),
                                            label: Image.asset(
                                              'assets/images/Following.png',
                                            ),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {},
                                            label: Image.asset(
                                              'assets/images/Chat.png',
                                              scale: 0.7,
                                            ),
                                            icon: const Text(
                                              '50',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/images/arab.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const Divider(
                                // Add a divider after each item
                                color: Colors.grey,
                                thickness: 1,
                                //indent: 16,
                                //endIndent: 16,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
