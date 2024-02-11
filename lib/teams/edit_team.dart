import 'dart:io';
import 'dart:typed_data';

import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isnad/teams/edit_team_class.dart';
import 'package:isnad/util/utilhome.dart';
import 'package:share_plus/share_plus.dart';

class Editteam extends StatefulWidget {
  const Editteam({super.key});

  @override
  State<Editteam> createState() => _EditteamState();
}

class _EditteamState extends State<Editteam> {
  XFile? imageFile;
  Uint8List? _image;
  void _selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  List networktextimage = [
    'assets/images/face1.png',
    'assets/images/face2.png',
    'assets/images/face1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff455727),
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 120,
              ),
              child: Center(
                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    _image != null
                        ? CircleAvatar(
                            radius: 100,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage(
                              'assets/images/ISNAD.png',
                            ),
                          ),
                    Positioned(
                      top: 140,
                      left: 150,
                      child: IconButton(
                        onPressed: _selectImage,
                        icon: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xff64B8FF),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 130,
                        left: 60,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: networktextimage.length,
                        itemBuilder: (context, index) {
                          return Align(
                            widthFactor: 0.7,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.black,
                                backgroundImage: AssetImage(
                                  networktextimage[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'تعديل تفاصيل الفريق',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'NotoKufiArabic',
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
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/drawer/background2.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: EditTeams.itemsTeam.length,
                  itemBuilder: (context, index) {
                    double height;
                    EdgeInsets customContentPadding;
                    if (index == 0 || index == EditTeams.itemsTeam.length - 1) {
                      // Use the same height for the first and last TextFormField
                      height = 56.0.h;
                      customContentPadding = const EdgeInsets.only(
                        top: 56.0,
                      );
                    } else if (index == 1) {
                      // Adjust the height for the second TextFormField
                      height = 100.0.h;
                      customContentPadding = const EdgeInsets.only(
                        top: 90,
                      );
                    } else {
                      // Use a default height for other TextFormFields
                      height = 56.0.h;
                      customContentPadding = const EdgeInsets.only(
                        top: 56.0,
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 200.w,
                        height: height,
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          maxLines: index == 1 ? null : 1,
                          keyboardType: index == 1
                              ? TextInputType.multiline
                              : TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: customContentPadding,
                              prefixIcon:
                                  index == EditTeams.itemsTeam.length - 1
                                      ? IconButton(
                                          onPressed: () {
                                            // Handle the IconButton press for the last TextFormField
                                          },
                                          icon: Image.asset(
                                            'assets/images/rigester/add.png',
                                          ),
                                        )
                                      : null,
                              suffixIcon: Image.asset(
                                EditTeams.itemsTeam[index].iconsteam!,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: EditTeams.itemsTeam[index].title,
                              hintStyle: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                              )),
                        ),
                      ),
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
