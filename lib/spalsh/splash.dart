import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isnad/obsscreen/Splash%20Screen.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({super.key});

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _duration = Duration.zero; // Initialize duration

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Splash_Screen(),
        ),
      );
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(
      begin: 0.5, // Start from halfway
      end: 1.0, // End at full progress
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ));

    // Start the animation
    _controller.forward();
    // Stop the animation after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _controller.stop();
    });

    // Calculate the remaining duration based on the animation's progress
    _duration = const Duration(seconds: 5) - _controller.lastElapsedDuration!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/isand.png',
            ),
            SizedBox(
              height: 50.h,
            ),
            if (defaultTargetPlatform == TargetPlatform.iOS)
              Column(
                children: [
                  const Text(
                    'Loading...',
                    style: TextStyle(
                      color: Color(0xff514170),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 301,
                    height: 29,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4.5,
                        color: Colors.white,
                      ),
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffD9D9D9),
                          offset: Offset(10.0, 10.0), //(x,y)
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: 20,
                        child: SimpleAnimationProgressBar(
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: 30,
                          width: 300, // Set width to fill parent
                          backgroundColor: Colors.white,
                          foregrondColor: const Color(0xff455727),
                          ratio: 1.0,
                          direction: Axis.horizontal,
                          duration: _duration,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  const Text(
                    'Loading...',
                    style: TextStyle(
                      color: Color(0xff514170),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 301,
                    height: 29,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
