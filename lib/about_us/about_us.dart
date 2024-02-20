import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  late Future<Map<String, dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse(
        'https://isnad.gavakw.com/api/pages',
      ),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '').replaceAll('&nbsp;', ' ').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'من نحن',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'NotoKufiArabic',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>>(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final responseData = snapshot.data!;
                final success = responseData['success'];
                final data = responseData['data'];
                final message = responseData['message'];

                return Column(
                  children: [
                    Image.asset(
                      'assets/images/isand.png',
                      scale: 1.8,
                    ),
                    if (success && data != null)
                      Column(
                        children: (data as List<dynamic>).map((datum) {
                          return Column(
                            children: [
                              Text(
                                datum['title'] ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'NotoKufiArabic',
                                  fontWeight: FontWeight.w500,
                                  height: 2.5,
                                ),
                              ),
                              Text(
                                removeHtmlTags(datum['description'] ?? ""),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'NotoKufiArabic',
                                  fontWeight: FontWeight.w500,
                                  height: 2.5,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
