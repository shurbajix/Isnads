import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/Event/event_class.dart';
import 'package:isnad/pages/location/location.dart';
import 'package:isnad/pages/profile/profile.dart';
import 'package:isnad/result/Resulit.dart';
import 'package:share_plus/share_plus.dart';

class Event_Details extends StatefulWidget {
  const Event_Details({super.key});

  @override
  State<Event_Details> createState() => _Event_DetailsState();
}

class _Event_DetailsState extends State<Event_Details> {
  final double coverHeight = 200.h;
  final double profileHeight = 60.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 30,
          right: 30,
        ),
        child: SizedBox(
          width: 271.w,
          height: 58.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: const Color(0xff455727),
            ),
            onPressed: () async {
              const urlPerview = 'https://www.youtube.com/watch?v=CNUBhb_cM6E';
              await Share.share('This will change for share $urlPerview');
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/next.png',
                ),
                SizedBox(
                  width: 20.w,
                ),
                const Text(
                  'ارغب بالمشاركة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 390.w,
                    height: coverHeight,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 10.0,
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/event.png',
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'اسم الإيفنت',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                              SizedBox(
                                width: 70.w,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: coverHeight - profileHeight / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfffefeff),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 60.h,
                      width: 295.w,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '+20 ذاهبون',
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                              ),
                            ),
                            Image.asset(
                              'assets/images/groupimage.png',
                            ),
                            SizedBox(
                              width: 80.w,
                              height: 28.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff455727),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                onPressed: () async {
                                  const urlPerview =
                                      'https://www.youtube.com/watch?v=CNUBhb_cM6E';
                                  await Share.share(
                                      'This will change for share $urlPerview');
                                },
                                child: const Text(
                                  'دعوة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NotoKufiArabic',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/love.png',
                      ),
                    ),
                    const Text(
                      'الفريق الاول',
                      style: TextStyle(
                        color: Color(0xff120D26),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontFamily: 'NotoKufiArabic',
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 310,
                //ResponsiveLayout.buttonWidth(context, baseWidth: 310.0),
                child: Stack(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: Eventdetails.eventdetail.length,
                      itemBuilder: (context, index) {
                        final isLastItem =
                            index == Eventdetails.eventdetail.length - 1;
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
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        if (!isLastItem && index == 1)
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: IconButton(
                                              onPressed: () async {
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1000),
                                                    () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Location(),
                                                    ),
                                                  );
                                                });
                                              },
                                              icon: Image.asset(
                                                'assets/images/Locationcolor.png',
                                              ),
                                            ),
                                          ),
                                        if (!isLastItem && index == 1)
                                          SizedBox(
                                            height: 8.h,
                                          ), // Adjust the height as needed
                                        if (isLastItem)
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                              width: 88.w,
                                              height: 28.h,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xff4ad2e415),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Profile(),
                                                    ),
                                                  );
                                                },
                                                child: const Text(
                                                  'متابعة',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'NotoKufiArabic',
                                                    color: Color(0xff979797),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          Eventdetails
                                              .eventdetail[index].texted,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'NotoKufiArabic',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          Eventdetails
                                              .eventdetail[index].descrption,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'NotoKufiArabic',
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff747688),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (index == 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (contex) =>
                                                    const Resulit(),
                                              ),
                                            );
                                          } else if (index == 1) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (contex) =>
                                                    const Location(),
                                              ),
                                            );
                                          } else if (index == 2) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (contex) =>
                                                    const Profile(),
                                              ),
                                            );
                                          } else {
                                            const Text(
                                              'sorry there is not page ',
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 48.w,
                                          height: 48.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.grey,
                                          ),
                                          child: Image.asset(
                                            Eventdetails.eventdetail[index]
                                                .iconAssetPath,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Text(
                  'التعليقات',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  10,
                  (index) {
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
                            //height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/Path.png',
                                      ),
                                      label: const Text(
                                        'رد',
                                        style: TextStyle(
                                          fontFamily: 'NotoKufiArabic',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      '4دقائق',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'NotoKufiArabic',
                                      ),
                                    ),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'عمرو خالد',
                                          style: TextStyle(
                                            color: Color(0xff5669FF),
                                            fontSize: 12.0,
                                            fontFamily: 'NotoKufiArabic',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6.02,
                                        ),
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundImage: AssetImage(
                                            'assets/images/omar.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 40,
                                    right: 20,
                                  ),
                                  child: Text(
                                    'متي التجمع يا شباب ؟؟',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'NotoKufiArabic',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
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
    );
  }
}
