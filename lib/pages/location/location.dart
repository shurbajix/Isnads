import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Event/Event_Details.dart';
import '../../Home/showhome.dart';

const LatLng currentLocation = LatLng(25.1193, 55.3773);

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool isFirstButtonSelected = false;
  bool isSecondButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> currentList = isFirstButtonSelected
        ? []
        : List.generate(
            1,
            (index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 390.w,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                ));

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 20,
          left: 2,
          right: 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: currentList,
        ),
      ),
      appBar: AppBar(
        title: SizedBox(
          width: 262,
          height: 51,
          child: TextFormField(
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff111719),
              ),
              hintText: "قم بالبحث هنا",
              hintStyle: const TextStyle(
                color: Color(0xff616679),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'NotoKufiArabic',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/Vector.png',
                  ),
                ),
              ),
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
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: currentLocation,
          zoom: 14,
        ),
        onMapCreated: (controller) {},
      ),
    );
  }
}
