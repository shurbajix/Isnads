import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'من نحن',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'NotoKufiArabic',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/isand.png',
                scale: 1.8,
              ),
              const Text(
                '''جمعية اسناد للدعم والتنمية جمعية نفع عام مشهرة من قبل وزارة الشؤون الاجتماعية تحت رقم ( 190/أ ) وهي تعتبر مشروع وطني تطوعي لاستقطاب الكفاءات الوطنية واصحاب الخبرات ومؤسسات المجتمع المدني للمساهمة بمبادرات ابداعية مجتمعية وتنموية لدعم خطة التنمية العامة للدولة 2035 وقامت باعداد هذا التطبيق الاجتماعي كي يساعد المجتمع علي التعاون في تنفيذ مبادرات اجتماعيه تنمويه تنهض بالبلد من اجل ان يتم فية تنفيذ فعاليات ومشاريع ومبادرات ذكية تدعم اهداف هذه الخطة التنموية العامة للدولة من خلال فرق تتشكل من افراد المجتمع ومؤسسات المجتمع المدني ويظهر في التطبيق بيانات الفرق والمشاريع والمناطق التي ينفذ فيها هذه المشروعات المجتمعية كما يشترك في تنفيذها ودعمها مؤسسات المجتمع المدني والشركات الخاصة''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'NotoKufiArabic',
                  fontWeight: FontWeight.w500,
                  height: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
