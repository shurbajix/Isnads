import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/log/login.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'منشوراتنا',
                style: TextStyle(
                    color: const Color(0xff19202D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoKufiArabic'),
              ),
              Text(
                "الاحد , 13 ديسمبر 2023",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff9397A0),
                  fontFamily: 'NotoKufiArabic',
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              'assets/images/arab.png',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: Color(0xff120D26),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 327.w,
                  height: 32.h,
                  child: TextFormField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: 'بحث',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'NotoKufiArabic',
                      ),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const VerticalDivider(
                            width: 30.0,
                            thickness: 3.0,
                            color: Colors.blue,
                            indent: 20.0,
                            endIndent: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/search.png',
                            ),
                          ),
                        ],
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 82.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xff455727),
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Image.asset(
                                  'assets/images/fillter.png',
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "تصفية",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily: 'NotoKufiArabic',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: titlesdtext.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {},
                        child: Text(
                          titlesdtext[index],
                          style: const TextStyle(
                            color: Color(0xff9397A0),
                            fontFamily: 'NotoKufiArabic',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: LayoutBuilder(
                    builder: (_, c) {
                      final width = c.maxWidth;
                      final height = c.maxHeight;
                      var fontSize = 16.0;
                      var itemHeight = 200.0; // Set a default height

                      if (width <= 480) {
                        fontSize = 16.0;
                        itemHeight =
                            height * 0.6; // Adjust the multiplier as needed
                      } else if (width > 480 && width <= 960) {
                        fontSize = 22.0;
                        itemHeight =
                            height * 0.8; // Adjust the multiplier as needed
                      } else {
                        fontSize = 28.0;
                        itemHeight =
                            height * 0.9; // Adjust the multiplier as needed
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              //height: 100,
                              //width: 255.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/views.png',
                                    fit: BoxFit.cover,
                                    scale: 0.8,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'هنا عنوان الخبر',
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff19202D),
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                      Text(
                                        'هنا يكتب تفاصيل عن الخبر في اكثر من سطر',
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: TextStyle(
                                          color: const Color(0xff19202D),
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/send.png',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.w,
                                      ),
                                      Row(
                                        children: [
                                          const Column(
                                            children: [
                                              Text(
                                                'اسم ناشر الخبر',
                                                style: TextStyle(
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                              Text(
                                                '9سبتمبر 2023',
                                                style: TextStyle(
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              'assets/images/cover.png',
                                            ),
                                          ),
                                        ],
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
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    left: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "اظهار الكل",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff455727),
                            fontFamily: 'NotoKufiArabic',
                          ),
                        ),
                      ),
                      Text(
                        'مقاطع',
                        style: TextStyle(
                          color: const Color(0xff19202D),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NotoKufiArabic',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
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
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 208.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 70.w,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/image1.png',
                                          ),
                                        ),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/play.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Top Trending",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                      Text(
                                        "Islands in 2022",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.visibility_outlined,
                                            color: Color(0xff9397A0),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '40,999',
                                            style: TextStyle(
                                              color: const Color(0xff9397A0),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List titlesdtext = [
  '#Health',
  '#Music',
  '#Technology',
  '#Sports',
];
