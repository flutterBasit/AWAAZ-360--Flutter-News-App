import 'package:awaaz360_news/Exceptions/InternetExceptions.dart';

import 'package:awaaz360_news/Resources/Constants/GNews_HomeScreen_Color.dart';

import 'package:awaaz360_news/View/News_Home_Screen/Widgets/Tab1_Widgets/Date_And_Time.dart';
import 'package:awaaz360_news/View/News_Home_Screen/Widgets/Tab1_Widgets/SportsGNews.dart';
import 'package:awaaz360_news/View/News_Home_Screen/Widgets/Tab2_Widgets/Search_And_Category.dart';
import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:shimmer/shimmer.dart';

class GNews_HomeScreen extends StatefulWidget {
  const GNews_HomeScreen({super.key});

  @override
  State<GNews_HomeScreen> createState() => _GNews_HomeScreenState();
}

class _GNews_HomeScreenState extends State<GNews_HomeScreen> {
  //Gnews_Services gnews_services = Gnews_Services();
  GNews_Service_Controller _gNews_Service_Controller =
      Get.put(GNews_Service_Controller());

  @override
  void initState() {
    super.initState();

    _gNews_Service_Controller.getGNews2a();
    _gNews_Service_Controller.getGNews2();
    _gNews_Service_Controller.updateCurrentDateTime();
  }

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      appBar: AppBar(
          leading: _gNews_Service_Controller.isDarkTheme.value
              ? Icon(Icons.nights_stay)
              : Icon(Icons.calendar_view_day),
          actions: [
            Obx(() {
              return IconButton(
                onPressed: () {
                  _gNews_Service_Controller.toggleTheme();
                },
                icon: Icon(
                  _gNews_Service_Controller.isDarkTheme.value
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              );
            })
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Obx(() {
            if (_gNews_Service_Controller.selectedIndex.value == 1) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/globe2.json',
                      height: height * 0.09, width: width * 0.15),
                  SizedBox(
                    width: 20,
                  ),
                  Text('AWAAZ 360',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: GnewsHomescreenColor.App_FontFamily,
                      ))
                ],
              );
            } else {
              return Text('AWAAZ 360',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: GnewsHomescreenColor.App_FontFamily,
                  ));
            }
          })),
      bottomNavigationBar: Obx(() {
        return ResponsiveNavigationBar(
          onTabChange: (index) {
            _gNews_Service_Controller.changeTab(index);
          },
          selectedIndex: _gNews_Service_Controller.selectedIndex.value,
          navigationBarButtons: <NavigationBarButton>[
            NavigationBarButton(
              text: 'News Feed',
              icon: Icons.newspaper,
              backgroundGradient: LinearGradient(
                colors: [
                  // Theme.of(context).colorScheme.secondary,
                  Colors.white30,
                  Theme.of(context).colorScheme.secondary
                ],
              ),
            ),
            NavigationBarButton(
              text: 'Explore',
              icon: Icons.explore,
              backgroundGradient: LinearGradient(
                colors: [
                  Colors.white30,
                  Theme.of(context).colorScheme.secondary
                ],
              ),
            ),
          ],
        );
      }),
      // backgroundColor: GnewsHomescreenColor.BackGroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(() {
        if (_gNews_Service_Controller.hasInternetError.value) {
          return const InternetException_Handling();
        } else {
          return _gNews_Service_Controller.selectedIndex.value == 0
              ? RefreshIndicator(
                  onRefresh: () {
                    return _gNews_Service_Controller.getGNews2a();
                  },
                  child: _Tab1Content())
              : Tab2_Content();
        }
      }),
    );
  }

  Widget _Tab1Content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          DateAndTime_With_CaursalSlider(),
          Sports_GNews(),
        ],
      ),
    );
  }
}
