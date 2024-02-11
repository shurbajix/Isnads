import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import 'package:table_calendar/table_calendar.dart';

import '../util/utilhome.dart';

class Event_edit extends StatefulWidget {
  const Event_edit({super.key});

  @override
  State<Event_edit> createState() => _addinitiativeState();
}

class _addinitiativeState extends State<Event_edit> {
  bool _lights = false;

  XFile? imageFile;
  Uint8List? _image;
  Future _selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  //create calnder to work for week and to work perfect time
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  DateTime? _firstDay;
  DateTime? _lastDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _firstDay = DateTime(_selectedDay!.year, _selectedDay!.month, 1);
    _lastDay = DateTime(_selectedDay!.year, _selectedDay!.month + 1, 0);
    _getCurrentTime();
  }

  //add here timer zone for hour
  TimeOfDay? currentTime;

  Future<void> _getCurrentTime() async {
    String? timeZone = await FlutterTimezone.getLocalTimezone();

    DateTime now = DateTime.now().toUtc();
    DateTime localTime = now.toLocal();

    setState(() {
      currentTime = TimeOfDay(hour: localTime.hour, minute: localTime.minute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 390.w,
                height: 182.h,
                decoration: BoxDecoration(
                  image: _image != null
                      ? DecorationImage(
                          image: MemoryImage(_image!),
                          fit: BoxFit
                              .cover, // Adjust this based on your requirements
                        )
                      : null,
                  color: _image == null ? const Color(0xffD9D9D9) : null,
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () async {
                              const urlPerview =
                                  'https://www.youtube.com/watch?v=CNUBhb_cM6E';
                              await Share.share(
                                'This will change for share $urlPerview',
                              );
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'تعديل المبادرة',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'NotoKufiArabic',
                            ),
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            var selectedImage = await _selectImage();
                            setState(() {
                              if (selectedImage != null) {
                                _image = selectedImage;
                              }
                            });
                          },
                          child: Container(
                            width: 114.w,
                            height: 31.h,
                            decoration: BoxDecoration(
                              color: _image == null
                                  ? const Color(0xff000000)
                                  : null,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/image.png',
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'اضافة الصورة',
                                  style: TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: _image == null ? Colors.white : null,
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
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'حالة المبادرة',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    CupertinoSwitch(
                      thumbColor: CupertinoColors.white,
                      activeColor: const Color(0xff5669FF),
                      value: _lights,
                      onChanged: (bool value) {
                        setState(() {
                          _lights = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    const Text(
                      'اسم المبادرة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 318.w,
                        height: 40.h,
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: 'هنا تكتب اسم المبادرة',
                            hintStyle: const TextStyle(
                              fontFamily: 'NotoKufiArabic',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    const Text(
                      'تفاصيل المبدارة',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 318.w,
                        height: 82.h,
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: 'هنا تكتب اسم المبادرة',
                            hintStyle: const TextStyle(
                              fontFamily: 'NotoKufiArabic',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          maxLines: 8,
                          minLines: 3,
                        ),
                      ),
                    ),
                    const Text(
                      'ميعاد المبادرة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  width: 250.w,
                  //height: 271.h,
                  child: Column(
                    children: [
                      TableCalendar(
                        firstDay: _firstDay!,
                        lastDay: _lastDay!,
                        focusedDay: _focusedDay!,
                        calendarFormat: CalendarFormat.month,
                        locale: 'en_US',
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                        ),
                        onPageChanged: (focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                            _firstDay =
                                DateTime(focusedDay.year, focusedDay.month, 1);
                            _lastDay = DateTime(
                                focusedDay.year, focusedDay.month + 1, 0);
                          });
                        },
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/upst.png',
                            ),
                          ),
                          currentTime != null
                              ? Text(
                                  '${currentTime!.hour.toString().padLeft(2, '0')}:${currentTime!.minute.toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'NotoKufiArabic',
                                  ),
                                )
                              : const CircularProgressIndicator(),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/downst.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/edits.png',
                    ),
                  ),
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ارض المعارض',
                            style: TextStyle(
                              color: Color(0xff120D26),
                              fontSize: 22,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                          Text(
                            'هنا يكتب العنوان تفصيلا',
                            style: TextStyle(
                              color: Color(0xff747688),
                              fontSize: 14,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        'assets/images/Location.png',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SizedBox(
                  width: 318.w,
                  height: 40.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff455727),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'اضافة مبادرة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
