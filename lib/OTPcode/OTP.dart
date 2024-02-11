import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/log/forget_password.dart';

//this page to send message to aprove account by sms
class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
              color: Color(0xff120D26),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تاكيد الهوية',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff120D26),
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text(
            'سوف يتم ارسال كود خاص بك للرقم الذي ادخلتة برجاء كتابته هنا',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff120D26),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoKufiArabic',
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 55,
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: SizedBox(
                        width: 55,
                        //height: 55,
                        child: TextFormField(
                          onSaved: (pin) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '0',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgetPassword(),
                ),
              );
            },
            child: Container(
              width: 271,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xff455727),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'المتابعة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'NotoKufiArabic',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xff6E9033),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          RichText(
            text: const TextSpan(
              text: ' اعادة الارسال في  ',
              style: TextStyle(
                color: Color(0xff120D26),
                fontSize: 16,
                fontFamily: 'NotoKufiArabic',
              ),
              children: [
                TextSpan(
                  text: '20:00',
                  style: TextStyle(
                    color: Color(
                      0xff3D56F0,
                    ),
                    fontSize: 16,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
