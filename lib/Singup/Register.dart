import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/OTPcode/OTP.dart';
import 'package:isnad/log/login.dart';

import 'createteam.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                  right: 10,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'انشاء حساب',
                    style: TextStyle(
                      color: Color(0xff120D26),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'NotoKufiArabic',
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    bool? isPassword = index >=
                        2; // Check if the current TextFormField is for a password
                    bool? isPasswordVisible =
                        false; // State variable to track password visibility

                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        right: 10,
                        left: 10,
                      ),
                      child: SizedBox(
                        width: 317.w,
                        height: 56,
                        child: TextFormField(
                          obscureText: isPassword ? !isPasswordVisible : false,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: imagesrigestertextfiled[index],
                            prefixIcon: isPassword
                                ? (index == 2 || index == 3)
                                    ? IconButton(
                                        icon: Icon(
                                          isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          // Toggle password visibility for the corresponding password field
                                          setState(() {
                                            isPasswordVisible =
                                                isPasswordVisible;
                                          });
                                        },
                                      )
                                    : null
                                : null,
                            hintText: textrigestertextfiled[index],
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                },
                child: Container(
                  width: 271.w,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(
                      0xff455727,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'انشاء حساب',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text(
                'او',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'NotoKufiArabic',
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: SizedBox(
                  width: 290.w,
                  //height: 56.h,
                  child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 56.h,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xffFFFFFF,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    textbuttons[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xff120D26),
                                      fontSize: 16,
                                      fontFamily: 'NotoKufiArabic',
                                    ),
                                  ),
                                  Image.asset(
                                    iconsbutton[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'لديك حساب ؟',
                    style: const TextStyle(
                      color: Color(0xff120D26),
                      fontSize: 16,
                      fontFamily: 'NotoKufiArabic',
                    ),
                    children: [
                      TextSpan(
                        text: ' تسجيل الدخول',
                        style: const TextStyle(
                          color: Color(0xff5669FF),
                          fontSize: 16,
                          fontFamily: 'NotoKufiArabic',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OTP(),
                              ),
                            );
                          },
                      ),
                    ],
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

// icons from figma file that add
List imagesrigestertextfiled = [
  Image.asset(
    'assets/images/rigester/Profile.png',
  ),
  Image.asset(
    'assets/images/rigester/Message.png',
  ),
  Image.asset(
    'assets/images/rigester/Password.png',
  ),
  Image.asset(
    'assets/images/rigester/Password.png',
  ),
];
// add rigester text for all textfiled using one list
List<String> textrigestertextfiled = [
  'الاسم بالكامل',
  'البديد الالكتروني',
  'كلمة المرور',
  'اعادة كلمة المرور',
];
