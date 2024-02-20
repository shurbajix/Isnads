import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../Singup/Register.dart';
import '../log/login.dart';
import 'get_organizations_types/get_organizations_types.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _HomeState();
}

class _HomeState extends State<Splash_Screen> {
  late bool success;
  late List<Data> data = [];
  late String message;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://isnad.gavakw.com/api/organizations/types-list'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      success = jsonResponse['success'];
      if (jsonResponse['data'] != null) {
        data = List<Data>.from(
          jsonResponse['data'].map((data) => Data.fromJson(data)),
        );
      }
      message = jsonResponse['message'];
    } else {
      throw Exception('Failed to load data');
    }

    setState(() {}); // Update the UI with the fetched data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                'assets/images/isand.png',
                scale: 1.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            if (data.isNotEmpty && data.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (data.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      child: _buildContainer(data[0]),
                    ),
                  if (data.length > 1)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: _buildContainer(data[0]),
                    ),
                ],
              ),
            const SizedBox(
              height: 40,
            ),
            if (data.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (data.length > 1)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: _buildContainer(data[1]),
                    ),
                  if (data.length > 2)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: _buildContainer(data[2]),
                    ),
                ],
              ),
            const SizedBox(
              height: 40,
            ),
            if (data.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (data.length > 3)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: _buildContainer(data[3]),
                    ),
                  if (data.length > 4)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: _buildContainer(data[4]),
                    ),
                ],
              ),
            const SizedBox(
              height: 40,
            ),
            if (data.isNotEmpty && data.length > 5)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                },
                child: _buildContainer(data[5]),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(Data item) {
    return Container(
      width: 111,
      height: 111,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: SvgPicture.network(
              item.image ?? '',
            ),
          ),
          Text(
            item.title ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoKufiArabic',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
