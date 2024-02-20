import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isnad/Service/api_Service.dart';
import 'package:isnad/Singup/Rigester_API/Rigester_API.dart';
import 'package:isnad/log/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordVisible1 = false; // Visibility flag for first password field
  bool isPasswordVisible2 = false; // Visibility flag for second password field

  final List<GlobalKey<FormState>> _formKeys = List.generate(
    4,
    (index) => GlobalKey<FormState>(),
  );
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final RigesterAPIcontroll registerController = Get.put(RigesterAPIcontroll());

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
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    bool isPassword = index >= 2;

                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        right: 10,
                        left: 10,
                      ),
                      child: SizedBox(
                        width: 317.w,
                        height: 56.h,
                        child: Form(
                          key: _formKeys[index],
                          child: TextFormField(
                            controller: index == 0
                                ? _fullNameController
                                : index == 1
                                    ? _emailController
                                    : index == 2
                                        ? _passwordController
                                        : _confirmPasswordController,
                            obscureText: isPassword
                                ? index == 2
                                    ? !isPasswordVisible1 // Use visibility flag for first password field
                                    : !isPasswordVisible2 // Use visibility flag for second password field
                                : false,
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
                                            index == 2
                                                ? isPasswordVisible1
                                                    ? Icons.visibility
                                                    : Icons.visibility_off
                                                : isPasswordVisible2
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (index == 2) {
                                                isPasswordVisible1 =
                                                    !isPasswordVisible1;
                                              } else {
                                                isPasswordVisible2 =
                                                    !isPasswordVisible2;
                                              }
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return subtitletextfiled[index];
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: _rigesterWithEmail, // Call the register function
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
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                                builder: (context) => const SignIn(),
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

  void _rigesterWithEmail() async {
    try {
      bool isAllValid =
          _formKeys.every((formKey) => formKey.currentState!.validate());

      if (!isAllValid) {
        return;
      }

      // Call the rigesterWithEmail method of RigesterAPIcontroll
      await registerController.rigesterWithEmail();
    } catch (e) {
      print('Error: $e');
      // Handle error as needed
    }
  }
}

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

List<String> textrigestertextfiled = [
  'الاسم بالكامل',
  'البديد الالكتروني',
  'كلمة المرور',
  'اعادة كلمة المرور',
];

List<String> subtitletextfiled = [
  'please enter your full Name',
  'please enter your Email',
  'please enter your password',
  'please enter your password',
];

List<String> textbuttons = ['تسجيل الدخول بالفيس بوك', 'تسجيل الدخول بالجوجل'];

List<String> iconsbutton = [
  'assets/images/google.png',
  'assets/images/facebook.png',
];
