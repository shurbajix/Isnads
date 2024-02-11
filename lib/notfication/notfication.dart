import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifcation extends StatefulWidget {
  const Notifcation({super.key});

  @override
  State<Notifcation> createState() => _NotifcationState();
}

class _NotifcationState extends State<Notifcation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Text(
            'الاشعارات',
            style: TextStyle(
              color: Color(0xff120D26),
              fontSize: 24,
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130.h,
              ),
              Image.asset(
                'assets/images/Artwork.png',
              ),
              const Text(
                'لايوجد اشعارات حاليا',
                style: TextStyle(
                  color: Color(0xff344B67),
                  fontSize: 24,
                  fontFamily: 'NotoKufiArabic',
                ),
              ),
              SizedBox(
                height: 7.29.h,
              ),
              const Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff3C3E56),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'NotoKufiArabic',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
