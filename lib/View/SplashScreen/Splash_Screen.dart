import 'dart:async';
import 'package:awaaz360_news/Resources/Constants/GNews_HomeScreen_Color.dart';
import 'package:awaaz360_news/Resources/Routes/RoutesName.dart';
import 'package:awaaz360_news/View/News_Home_Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //  Navigate to home after splash
    Timer(Duration(seconds: 10), () {
      Get.offNamed(RouteName.Home_Screen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Background Gradient or Animation

          // Main Content (Logo and Text)
          // CircleAvatar(
          //   minRadius: 120,
          //   // radius: 200.0,
          //   backgroundImage:
          //       AssetImage('assets/images/AWAAZ360.jpeg'), // Use your logo here
          //   //  backgroundColor: Colors.transparent,
          // ),

          //  SizedBox(height: 20.0),
          // App Name

          // Row(
          //   //  crossAxisAlignment: CrossAxisAlignment.stretch,
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [

          //     Lottie.asset('assets/images/newspaper2.json',
          //         height: height * 0.3, width: width * 0.3)
          //   ],
          // ),
          // Tagline

          Center(
            child: Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(150),
              child: CircleAvatar(
                  radius: height * 0.3,
                  backgroundColor: Theme.of(context).cardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 15,
                        borderRadius: BorderRadius.circular(100),
                        child: CircleAvatar(
                          radius: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' AWAAZ \n    360',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 30,
                                    fontFamily:
                                        GnewsHomescreenColor.App_FontFamily),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 35,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  Icon(
                                    Icons.newspaper,
                                    size: 35,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  Icon(
                                    Icons.mic,
                                    size: 35,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Lottie.asset('assets/images/globe2.json',
                          height: height * 0.15, width: width * 0.4),
                    ],
                  )),
            ),
          ),

          SizedBox(
            height: 40,
          ),
          Text(
            'STAY UPDATED STAY INFORMED',
            style: TextStyle(
              fontFamily: GnewsHomescreenColor.App_FontFamily,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          LoadingAnimationWidget.beat(
              size: 60, color: Theme.of(context).colorScheme.secondary)
        ],
      ),
    );
  }
}
