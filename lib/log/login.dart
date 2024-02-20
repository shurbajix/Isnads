import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:isnad/Home/Home.dart';
import 'package:isnad/log/forget_password.dart';

import '../OTPcode/OTP.dart';
import '../Singup/Register.dart';
import 'Login_as_Organization/Login_as_Organization.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? isAPIcallProcess = false;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  bool? _lights = false;
  bool _obscureText = true;
  final bool _isVisible = false;
  bool? _passwordVisible = false;
  String? _password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _handleLogin(String email, String password) async {
    // Declare loginResponse variable
    late Login_as_Organization loginResponse;

    // Validate the form
    for (var formKey in _formKeys) {
      if (formKey.currentState!.validate()) {
        // If the form is valid, proceed with login
        formKey.currentState!.save();
      } else {
        // If the form is invalid, return
        return;
      }
    }

    try {
      // Perform login API call
      var response = await http.post(
        Uri.parse('https://isnad.gavakw.com/api/auth/login'),
        body: {
          // Add your login parameters here, for example:
          'email': email,
          'password': password,
        },
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        // Parse the response
        loginResponse = Login_as_Organization.fromJson(jsonResponse);

        // Check if login was successful
        if (loginResponse.success == true) {
          // Navigate to home screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          );
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loginResponse.message ?? 'Login failed'),
            ),
          );
        }
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to login. Please try again later.'),
          ),
        );
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/isand.png',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Color(0xff120D26),
                    fontSize: 25,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 317.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      bool? isVisible = index == 1 ? _passwordVisible : true;

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            key: _formKeys[index],
                            child: TextFormField(
                              obscureText: !isVisible!,
                              onChanged: (value) {
                                if (index == 1) {
                                  _password = value;
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: Image.asset(
                                  iconesd[index],
                                ),
                                prefixIcon: index == 1
                                    ? IconButton(
                                        icon: Icon(
                                          isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible!;
                                          });
                                        },
                                      )
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return index == 0
                                      ? 'Please enter your email'
                                      : 'Please enter your password';
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTP(),
                        ),
                      );
                    },
                    child: Text(
                      'هل نسيت كلمة المرور ؟',
                      style: TextStyle(
                        color: const Color(
                          0xff120D26,
                        ),
                        fontSize: 13.sp,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'تذكرني',
                        style: TextStyle(
                          color: const Color(
                            0xff120D26,
                          ),
                          fontSize: 14.sp,
                          fontFamily: 'NotoKufiArabic',
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CupertinoSwitch(
                        thumbColor: CupertinoColors.white,
                        activeColor: const Color(0xff5669FF),
                        value: _lights!,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Call the method to handle login
                    setState(() {
                      _handleLogin;
                    });
                  },
                  child: Container(
                    width: 271.w,
                    height: 58,
                    decoration: BoxDecoration(
                      color: const Color(0xff455727),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: const Color(0xff6E9033),
                          child: Image.asset(
                            'assets/images/Shape.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Text(
                  'او',
                  style: TextStyle(
                    color: const Color(0xff9D9898),
                    fontSize: 15.sp,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
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
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
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
                    text: 'ليس لديك حساب ؟',
                    style: const TextStyle(
                      color: Color(0xff120D26),
                      fontFamily: 'NotoKufiArabic',
                    ),
                    children: [
                      TextSpan(
                        text: ' أنشاء حساب',
                        style: const TextStyle(
                          color: Color(0xff5669FF),
                          fontFamily: 'NotoKufiArabic',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
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

// list images for icons
List iconesd = [
  'assets/images/Mail.png',
  'assets/images/Password.png',
];
// this for these two textfiled
List<String> textbuttons = [
  'تسجيل الدخول بواسطة جوجل',
  'تسجيل الدخول بواسطة فيسبوك',
];
// this list add image from figma design for the app
List<dynamic> iconsbutton = [
  'assets/images/google.png',
  'assets/images/facebook.png',
];
