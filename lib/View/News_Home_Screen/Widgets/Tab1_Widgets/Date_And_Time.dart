import 'package:awaaz360_news/Exceptions/InternetExceptions.dart';
import 'package:awaaz360_news/Resources/Components/ReUsableContainer.dart';
import 'package:awaaz360_news/Resources/Constants/GNews_HomeScreen_Color.dart';
import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class DateAndTime_With_CaursalSlider extends StatelessWidget {
  const DateAndTime_With_CaursalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    GNews_Service_Controller gNews_Service_Controller =
        Get.put(GNews_Service_Controller());

    final height = Get.height;
    final width = Get.width;

    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gNews_Service_Controller.hasInternetError.value
              ? InternetException_Handling()
              :
              // If there are no articles, display a loading indicator
              gNews_Service_Controller.articles2a.isEmpty
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: width * 0.4,
                                height: 220,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              SizedBox(width: 40),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 59,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: width * 0.2,
                            height: 30,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: width * 0.8,
                              height: 220,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: width * 0.2,
                            height: 30,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: width * 0.7,
                            height: 30,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: width * 0.6,
                            height: 30,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: width * 0.5,
                            height: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Add some padding for spacing
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: gNews_Service_Controller.currentDateTime
                                      .split('\n')[0], // Display date
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily:
                                        GnewsHomescreenColor.App_FontFamily,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nWelcome",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GnewsHomescreenColor.App_FontFamily,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "\nGood ${gNews_Service_Controller.currentDateTime.split('\n')[1]}", // Display time of day
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GnewsHomescreenColor.App_FontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Lottie.asset('assets/images/globe2.json',
                            height: height * 0.2, width: width * 0.3),
                      ],
                    ),

          if (gNews_Service_Controller.articles2a.isEmpty) Center(),

          // Else, show the PageView with images and truncated headlines
          if (gNews_Service_Controller.articles2a.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 20,
                color: const Color.fromARGB(185, 255, 255, 255),
                child: ReUsable_Container(
                  width: 120,
                  color: Theme.of(context).cardColor,
                  radius: BorderRadius.circular(5),
                  child: Center(
                    child: Text(
                      'Trending',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: GnewsHomescreenColor.App_FontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 35,
          ),

          Center(
            child: Obx(() {
              // Using Obx to update the UI when the article list changes
              if (gNews_Service_Controller.articles2a.isEmpty) {
                return Center();
              } else {
                return CarouselSlider(
                  items: gNews_Service_Controller.articles2a.map((article) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            // Image from article
                            InkWell(
                              onTap: () {
                                gNews_Service_Controller.LaunchUrl2(
                                    Uri.parse(article.url.toString()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 220,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      20), // Optional border radius
                                  image: DecorationImage(
                                    image: NetworkImage(article.image
                                        .toString()), // Assuming article has an imageUrl field
                                    fit: BoxFit
                                        .cover, // Adjust to cover the whole container
                                  ),
                                ),
                              ),
                            ),
                            // Title overlay on the image
                            Positioned(
                              top: 130.0, // Positioning text at the bottom
                              left: 10.0, // Align text to the left
                              right: 10.0, // Align text to the right
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                decoration: BoxDecoration(
                                  color: Colors
                                      .black54, // Semi-transparent background for text
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  gNews_Service_Controller.truncateHeadline(article
                                      .title
                                      .toString()), // Assuming article has a title field
                                  style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontSize: 18.0, // Font size
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GnewsHomescreenColor.App_FontFamily),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true, // Enable auto-play
                    autoPlayInterval:
                        Duration(seconds: 6), // Auto-play interval
                    enlargeCenterPage: true, // Center the image in the view
                    aspectRatio: 16 / 9, // Adjust aspect ratio
                    viewportFraction:
                        0.8, // Width of the image relative to the screen
                  ),
                );
              }
            }),
          )
        ],
      );
    });
  }
}
