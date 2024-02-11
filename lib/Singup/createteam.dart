import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/Home/Home.dart';
import 'package:isnad/log/login.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({super.key});

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
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
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'انشاء فريق',
                      style: TextStyle(
                        color: Color(0xff120D26),
                        fontSize: 24,
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              SizedBox(
                width: 317.w,
                child: ListView.builder(
                  itemCount: iconsitems.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    bool isLastItem = index == iconsitems.length - 1;
                    bool isSecondItem = index == 1;
                    return SizedBox(
                      //width: 317.w,
                      height: isSecondItem ? 120.h : 56.h,

                      child: TextFormField(
                        maxLines: isSecondItem ? 5 : 1,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          suffixIcon: Image.asset(
                            iconsitems[index],
                          ),
                          prefixIcon: isLastItem
                              ? GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/rigester/add.png',
                                  ),
                                )
                              : null,
                          hintText: texttextfromfiled[index],
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'NotoKufiArabic',
                            color: Color(0xff747688),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: isLastItem ? 16.0 : 0.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 146.h,
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
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff455727),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'انشاء الفريق',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoKufiArabic',
                      ),
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

// this list will add the items inside textfiled the same with figma desgin
List iconsitems = [
  'assets/images/rigester/Profile.png',
  'assets/images/rigester/info.png',
  'assets/images/rigester/people.png',
];
// this other list that will add the name inside the textfiled i mean the text
List<String> texttextfromfiled = [
  'اسم الفريق',
  'تفاصيل الفريق',
  'اضافة اعضاء',
];
