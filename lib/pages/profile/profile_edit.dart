import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import '../../util/utilhome.dart';

class Profile_Edit extends StatefulWidget {
  const Profile_Edit({super.key});

  @override
  State<Profile_Edit> createState() => _Profile_EditState();
}

class _Profile_EditState extends State<Profile_Edit> {
  bool _obscureText = true;
  String? _password;

// Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  XFile? imageFile;
  Uint8List? _image;
  Future _selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 188,
                child: PreferredSize(
                  preferredSize: const Size.fromHeight(188),
                  child: AppBar(
                    backgroundColor: const Color(0xff455727),
                    flexibleSpace: const Stack(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: -80,
                          //left: 140,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(
                              'assets/images/arabh.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    leading: IconButton(
                      onPressed: () async {
                        const urlPerview =
                            'https://www.youtube.com/watch?v=CNUBhb_cM6E';
                        await Share.share(
                            'This will change for share $urlPerview');
                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                    actions: [
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
                    centerTitle: true,
                    title: Text(
                      'تعديل الملف الشخصي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Center(
                child: TextButton(
                  onPressed: _selectImage,
                  child: Text(
                    'تغيير الصورة',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'NotoKufiArabic',
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(4, (index) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          profiletitle[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontFamily: 'NotoKufiArabic',
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 36,
                            right: 36,
                            bottom: 15,
                          ),
                          child: SizedBox(
                            width: 318.w,
                            height: 40.h,
                            child: index == 0
                                ? TextFormField(
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  )
                                : index == 1
                                    ? TextFormField(
                                        textAlign: TextAlign.end,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      )
                                    : index == 2
                                        ? TextFormField(
                                            textAlign: TextAlign.end,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          )
                                        : TextFormField(
                                            textAlign: TextAlign.end,
                                            obscureText: _obscureText,
                                            decoration: InputDecoration(
                                              prefixIcon: IconButton(
                                                onPressed: () {
                                                  _toggle();
                                                },
                                                icon: Icon(
                                                  _obscureText
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 283.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xff455727),
                  ),
                  onPressed: () {},
                  child: Text(
                    'حفظ التغييرات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'NotoKufiArabic',
                    ),
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

// there is a list to add the name and the infromation for title
List profiletitle = [
  "اسم المستخدم",
  "البريد الالكتروني",
  "رقم الهاتف",
  "كلمة المرور",
];
