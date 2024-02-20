import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/Home/Home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Splash Screen.dart';

class Obsscreen extends StatefulWidget {
  const Obsscreen({super.key});

  @override
  State<Obsscreen> createState() => _HomeState();
}

class _HomeState extends State<Obsscreen> {
  final controller = PageController();
  int currentPage = 0; // Track the current page

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: Imageandandtext.imageandandtext.length,
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 220,
            ),
            child: Image.asset(
              Imageandandtext.imageandandtext[index].imagesd,
              alignment: Alignment.center,
            ),
          );
        },
        onPageChanged: (int page) {
          setState(() {
            currentPage = page; // Update the current page
          });
        },
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Color(0xff455727),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
            topRight: Radius.circular(70),
          ),
        ),
        height: 288.h,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                Imageandandtext.imageandandtext[currentPage].titlesd,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'NotoKufiArabic',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                Imageandandtext.imageandandtext[currentPage].subtitlesd,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'NotoKufiArabic',
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (currentPage > 0) {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // If on the first page, you can choose to handle skip behavior
                        // For now, just go to the last page
                        controller.jumpToPage(
                            Imageandandtext.imageandandtext.length - 1);
                      }
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: Imageandandtext.imageandandtext.length,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentPage <
                          Imageandandtext.imageandandtext.length - 1) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Splash_Screen(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Imageandandtext {
  String imagesd;
  String titlesd;
  String subtitlesd;

  Imageandandtext({
    required this.imagesd,
    required this.subtitlesd,
    required this.titlesd,
  });

  static List<Imageandandtext> imageandandtext = [
    Imageandandtext(
      imagesd: 'assets/images/obc/1.png',
      subtitlesd: 'كل ما تحتاجه في مكان واحد من فعاليات و مبادرات',
      titlesd: 'مبادرات تطبيق اسناد في الكويت',
    ),
    Imageandandtext(
      imagesd: 'assets/images/obc/2.png',
      titlesd: 'تعرف على شهادة فرسان الوطن ',
      subtitlesd:
          'وهى شهادة مقدمة من اسناد للاعضاء الاكثر تفاعل و حصول مبادراتهم على مشاركة عدد كبير و اعجاب او تعليقات',
    ),
    Imageandandtext(
      imagesd: 'assets/images/obc/3.png',
      subtitlesd: 'جميع تفاصيل الاحداث و المبادرات القريبة منك و من يحضرها',
      titlesd: 'و يمكنك معرفة جميع الاحداث القريبة منك',
    ),
  ];
}
