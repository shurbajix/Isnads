import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:table_calendar/table_calendar.dart';

class addinitiative extends StatefulWidget {
  const addinitiative({super.key});

  @override
  State<addinitiative> createState() => _addinitiativeState();
}

class _addinitiativeState extends State<addinitiative> {
  bool _lights = false;
  PlatformFile? _imagePicked;
  void openFile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return;
      setState(() {
        _imagePicked = result.files.first;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
    // if (resultFile != null) {
    //   PlatformFile file = resultFile.files.first;
    //   print(file.name);
    //   print(file.bytes);
    //   print(file.extension);
    //   print(file.path);
    // } else {
    //   // do something  if here the user cancled the picker
    // }
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffD9D9D9),
        shadowColor: const Color(0xffD9D9D9),
        actions: [
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
        title: Text(
          'اضافة مبادرة',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'NotoKufiArabic',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 390.w,
                height: 182.h,
                decoration: const BoxDecoration(
                  color: Color(0xffD9D9D9),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            openFile();
                          },
                          child: Container(
                            width: 114.w,
                            height: 31.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
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
                                const Text(
                                  'اضافة الصورة',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NotoKufiArabic',
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
                    Text(
                      'حالة المبادرة',
                      style: TextStyle(
                        fontSize: 14.sp,
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
                    Text(
                      'اسم المبادرة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
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
                    Text(
                      'تفاصيل المبدارة',
                      style: TextStyle(
                        fontSize: 14.sp,
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
                    Text(
                      'ميعاد المبادرة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
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
                                  style: const TextStyle(fontSize: 24),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ارض المعارض',
                            style: TextStyle(
                              color: const Color(0xff120D26),
                              fontSize: 22.sp,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                          Text(
                            'هنا يكتب العنوان تفصيلا',
                            style: TextStyle(
                              color: const Color(0xff747688),
                              fontSize: 14.sp,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'اضافة مبادرة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
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
