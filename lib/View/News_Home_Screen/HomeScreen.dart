// import 'package:awaaz360_news/Resources/Components/ReUsableContainer.dart';
// import 'package:awaaz360_news/Resources/Constants/GNews_HomeScreen_Color.dart';
// import 'package:awaaz360_news/Services/News_Services.dart';
// import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

// class GNews_HomeScreen extends StatefulWidget {
//   const GNews_HomeScreen({super.key});

//   @override
//   State<GNews_HomeScreen> createState() => _GNews_HomeScreenState();
// }

// class _GNews_HomeScreenState extends State<GNews_HomeScreen> {
//   //Gnews_Services gnews_services = Gnews_Services();
//   GNews_Service_Controller _gNews_Service_Controller =
//       Get.put(GNews_Service_Controller());

//   final PageController _pageController =
//       PageController(viewportFraction: 0.8); // Create a PageController

//   @override
//   void initState() {
//     super.initState();
//     _gNews_Service_Controller.initialize(_pageController);
//     _gNews_Service_Controller.getGNews2a();
//     _gNews_Service_Controller.getGNews2();
//     _gNews_Service_Controller.updateCurrentDateTime();
//     _gNews_Service_Controller.startAutoScroll();
//   }

//   @override
//   void dispose() {
//     _gNews_Service_Controller.stopAutoScroll(); // Stop the timer when disposing
//     _pageController.dispose(); // Dispose the PageController
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           centerTitle: true,
//           title: Obx(() {
//             if (_gNews_Service_Controller.selectedIndex.value == 1) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.public_outlined,
//                     size: 35,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text('AWAAZ 360',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: GnewsHomescreenColor.App_FontFamily,
//                       ))
//                 ],
//               );
//             } else {
//               return Text('AWAAZ 360',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: GnewsHomescreenColor.App_FontFamily,
//                   ));
//             }
//           })),
//       bottomNavigationBar: Obx(() {
//         return ResponsiveNavigationBar(
//           onTabChange: (index) {
//             _gNews_Service_Controller.changeTab(index);
//           },
//           selectedIndex: _gNews_Service_Controller.selectedIndex.value,
//           navigationBarButtons: <NavigationBarButton>[
//             NavigationBarButton(
//               text: 'News Feed',
//               icon: Icons.newspaper,
//               backgroundGradient: LinearGradient(
//                 colors: [Colors.white24, Colors.black],
//               ),
//             ),
//             NavigationBarButton(
//               text: 'Explore',
//               icon: Icons.explore,
//               backgroundGradient: LinearGradient(
//                 colors: [
//                   Colors.black,
//                   Colors.white24,
//                 ],
//               ),
//             ),
//           ],
//         );
//       }),
//       backgroundColor: GnewsHomescreenColor.BackGroundColor,
//       body: Obx(() {
//         if (_gNews_Service_Controller.selectedIndex.value == 0) {
//           return _Tab1Content(); // Show Tab 1 content
//         } else {
//           return _Tab2Content(); // Show Tab 2 content
//         }
//       }),
//     );
//   }

//   Widget _Tab1Content() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           _DateTime_And_ScrollPic_Widget(),
//           _PoliticalGNews(),
//         ],
//       ),
//     );
//   }

//   Widget _DateTime_And_ScrollPic_Widget() {
//     return Obx(() {
//       return Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // If there are no articles, display a loading indicator
//           if (_gNews_Service_Controller.articles2a.isEmpty)
//             Center(child: CircularProgressIndicator()),

//           // Else, show the PageView with images and truncated headlines
//           if (_gNews_Service_Controller.articles2a.isNotEmpty)
//             Row(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.all(8.0), // Add some padding for spacing
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: _gNews_Service_Controller.currentDateTime
//                               .split('\n')[0], // Display date
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.normal,
//                             fontFamily: GnewsHomescreenColor.App_FontFamily,
//                           ),
//                         ),
//                         TextSpan(
//                           text: "\nWelcome",
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: GnewsHomescreenColor.App_FontFamily,
//                           ),
//                         ),
//                         TextSpan(
//                           text:
//                               "\nGood ${_gNews_Service_Controller.currentDateTime.split('\n')[1]}", // Display time of day
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: GnewsHomescreenColor.App_FontFamily,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 40,
//                 ),
//                 Icon(
//                   Icons.public,
//                   size: 100,
//                 )
//               ],
//             ),
//           SizedBox(
//             height: 10,
//           ),
//           if (_gNews_Service_Controller.articles2a.isEmpty)
//             Center(child: CircularProgressIndicator()),

//           // Else, show the PageView with images and truncated headlines
//           if (_gNews_Service_Controller.articles2a.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(left: 10.0),
//               child: Material(
//                 borderRadius: BorderRadius.circular(5),
//                 elevation: 20,
//                 color: const Color.fromARGB(185, 255, 255, 255),
//                 child: ReUsable_Container(
//                   width: 120,
//                   color: GnewsHomescreenColor.Round_Container_Color,
//                   radius: BorderRadius.circular(5),
//                   child: Center(
//                     child: Text(
//                       'Trending',
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: GnewsHomescreenColor.App_FontFamily,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           SizedBox(
//             height: 35,
//           ),
//           SizedBox(
//             height: 210.0, // Set a fixed height for the image carousel
//             child: PageView.builder(
//               // key: PageStorageKey('pageview'),
//               controller:
//                   _pageController, // For showing part of the next/previous image
//               itemCount: _gNews_Service_Controller.articles2a.length,
//               itemBuilder: (context, index) {
//                 final article = _gNews_Service_Controller.articles2a[index];

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: Stack(
//                     children: [
//                       // Display the image with error handling
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: InkWell(
//                           onTap: () {
//                             _gNews_Service_Controller.LaunchUrl2(
//                                 Uri.parse(article.url.toString()));
//                           },
//                           child: Image.network(
//                             article.image ??
//                                 "https://via.placeholder.com/150", // Ensure there's a fallback image
//                             // color: GnewsHomescreenColor.BackGroundColor,
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                             // Add error handling
//                             errorBuilder: (context, error, stackTrace) {
//                               return ReUsable_Container(
//                                 color: Colors.grey, // Placeholder color
//                                 child: Center(
//                                   child: Icon(Icons.error,
//                                       size: 100,
//                                       color: Colors.red), // Error icon
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       // Overlay to display the truncated headline
//                       Positioned(
//                         bottom: 10,
//                         left: 10,
//                         right: 10,
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           color: Colors.black54,
//                           child: Text(
//                             _gNews_Service_Controller.truncateHeadline(
//                                 article.title), // Truncate the headline
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                             ),
//                             maxLines: 1, // Show only one line of the title
//                             overflow: TextOverflow
//                                 .ellipsis, // Show '...' if text is too long
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }

//   Widget _PoliticalGNews() {
//     _gNews_Service_Controller.getGNews2();
//     return Obx(() {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           if (_gNews_Service_Controller.articles2.isEmpty)
//             Center(child: CircularProgressIndicator()),
//           if (_gNews_Service_Controller.articles2.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(left: 10.0),
//               child: Material(
//                 borderRadius: BorderRadius.circular(5),
//                 elevation: 20,
//                 color: const Color.fromARGB(185, 255, 255, 255),
//                 child: ReUsable_Container(
//                   width: 100,
//                   color: GnewsHomescreenColor.Round_Container_Color,
//                   radius: BorderRadius.circular(5),
//                   child: Center(
//                     child: Text(
//                       'Sports',
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: GnewsHomescreenColor.App_FontFamily,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           SizedBox(
//             height: 30,
//           ),
//           IntrinsicHeight(
//             child: SizedBox(
//               height: 400, // Adjust the height if needed
//               child: ListView.builder(
//                 itemCount: _gNews_Service_Controller.articles2.length,
//                 itemBuilder: (context, index) {
//                   final article = _gNews_Service_Controller.articles2[index];
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
//                     child: IntrinsicHeight(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment
//                             .start, // Align text and image at the top
//                         children: [
//                           VerticalDivider(
//                             //  indent: 20,
//                             // endIndent: 20,
//                             color: Colors.black,
//                             thickness: 4,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     _gNews_Service_Controller.LaunchUrl2(
//                                         Uri.parse(article.url.toString()));
//                                   },
//                                   child: Center(
//                                     child: Text(
//                                       article.title.toString(),
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily:
//                                             GnewsHomescreenColor.App_FontFamily,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Text(article.source!.name.toString() ?? ''),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Text(article.publishedAt.toString() ?? '')
//                               ],
//                             ),
//                           ),
//                           SizedBox(width: 20), // Spacing between image and text
//                           // Image part
//                           InkWell(
//                             onTap: () {
//                               _gNews_Service_Controller.LaunchUrl2(
//                                   Uri.parse(article.url.toString()));
//                             },
//                             child: Material(
//                               borderRadius: BorderRadius.circular(20),
//                               elevation: 20,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Center(
//                                   child: Image.network(
//                                     article.image ??
//                                         "https://via.placeholder.com/150", // Fallback image
//                                     fit: BoxFit.cover,
//                                     width: 120, // Set image width
//                                     height: 250, // Set image height
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Container(
//                                         width: 120,
//                                         height: 140,
//                                         color: Colors.grey,
//                                         child: Center(
//                                           child: Icon(
//                                             Icons.error,
//                                             color: Colors.red,
//                                             size: 50,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       );
//     });
//   }

//   Widget _Tab2Content() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 10,
//         ),

//         Obx(() {
//           return Center(
//             // Centering the entire search area
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Search Icon
//                 if (!_gNews_Service_Controller.isCountrySearchActive
//                     .value) // Show only when search is inactive
//                   IconButton(
//                     icon: Icon(Icons.search,
//                         size:
//                             40), // Make the search icon slightly larger if needed
//                     onPressed: _gNews_Service_Controller
//                         .toggleCountrySearch, // Toggle search bar on click
//                   ),

//                 // Animated TextField
//                 AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   height: 50,
//                   width: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? 200.0
//                       : 0.0,
//                   curve: Curves.easeInOut,
//                   child: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? TextField(
//                           onChanged: (value) {
//                             _gNews_Service_Controller.searchCountry.value =
//                                 value;
//                           },
//                           decoration: InputDecoration(
//                             hintText: 'Enter Country code... us uk pk ',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                           ),
//                         )
//                       : null, // Hide TextField when inactive
//                 ),

//                 // Animated Button
//                 AnimatedOpacity(
//                   opacity: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? 1.0
//                       : 0.0,
//                   duration: Duration(milliseconds: 300),
//                   child: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? IconButton(
//                           onPressed: () {
//                             _gNews_Service_Controller.searchAndSelectCountry(
//                                 _gNews_Service_Controller.searchCountry.value);
//                           },
//                           icon: Icon(Icons.search))
//                       : null, // Hide Button when inactive
//                 ),
//               ],
//             ),
//           );
//         }),

//         SizedBox(
//           height: 20,
//         ),
//         // Category selector that opens a full-screen dialog
//         GestureDetector(
//           onTap: () {
//             Get.dialog(
//               Scaffold(
//                 backgroundColor: Color(0xff1D1E1D),
//                 appBar: AppBar(
//                   backgroundColor: Color(0xff1D1E1D),
//                   centerTitle: true,
//                   title: Text(
//                     'Select Category',
//                     style: TextStyle(
//                       fontFamily: GnewsHomescreenColor.App_FontFamily,
//                       color: Colors.white,
//                     ),
//                   ),
//                   automaticallyImplyLeading: false,
//                   actions: [
//                     IconButton(
//                       icon: Icon(Icons.close, color: Colors.white),
//                       onPressed: () => Get.back(),
//                     )
//                   ],
//                 ),
//                 body: ListView(
//                   children: _gNews_Service_Controller.categories
//                       .map((String category) {
//                     return ListTile(
//                       title: Text(
//                         category,
//                         style: TextStyle(
//                           fontFamily: GnewsHomescreenColor.App_FontFamily,
//                           fontSize: 35,
//                           color: Colors.white,
//                         ),
//                       ),
//                       onTap: () {
//                         _gNews_Service_Controller.selectCategory(category);
//                         Get.back(); // Close the dialog after selection
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               barrierDismissible: true,
//             );
//           },
//           child: Center(
//             child: Container(
//               height: 55,
//               width: 200,
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               // Wrapping this section in Obx to listen for changes in selectedItem
//               child: Obx(() {
//                 return Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       _gNews_Service_Controller
//                               .selectedCategory.value.isNotEmpty
//                           ? _gNews_Service_Controller.selectedCategory.value
//                           : 'Select Category',
//                       style: TextStyle(
//                         fontFamily: GnewsHomescreenColor.App_FontFamily,
//                         fontSize: 18,
//                       ),
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       size: 40,
//                     ),
//                   ],
//                 );
//               }),
//             ),
//           ),
//         ),

// // Country search bar with animation

// // Conditional text display based on category selection
//         Obx(() {
//           return _gNews_Service_Controller.searchCountry.value == ''
//               ? Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: Text(
//                       ' All \n News \n around \n the World',
//                       style: TextStyle(
//                         fontFamily: GnewsHomescreenColor.App_FontFamily,
//                         fontSize: 45,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )
//               : Expanded(
//                   child: ListView.builder(
//                     itemCount: _gNews_Service_Controller.articles.length,
//                     itemBuilder: (context, index) {
//                       final article = _gNews_Service_Controller.articles[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 8.0,
//                             horizontal: 16.0), // Optional padding for spacing
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment
//                               .start, // Align to the start of the column
//                           children: [
//                             // Row for title and image
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment
//                                   .start, // Align the text and image to the top
//                               children: [
//                                 // Title Text
//                                 Expanded(
//                                   child: Column(
//                                     //   mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           _gNews_Service_Controller.LaunchUrl2(
//                                               Uri.parse(
//                                                   article.url.toString()));
//                                         },
//                                         child: Text(
//                                           article.title.toString(),
//                                           style: TextStyle(
//                                             fontSize: 20.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                       Text(
//                                         article.publishedAt.toString(),
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Text(
//                                         article.source!.name.toString(),
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 // Article Image
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: SizedBox(
//                                     width:
//                                         120.0, // Set a fixed width for the image
//                                     height:
//                                         170.0, // Set a fixed height for the image
//                                     child: article.title != null
//                                         ? Image.network(
//                                             article.image.toString(),
//                                             fit: BoxFit.cover,
//                                           )
//                                         : Placeholder(), // Display placeholder if no image is available
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             // Description below the Row
//                             SizedBox(
//                                 height:
//                                     8.0), // Add some spacing between the Row and description
//                             Text(
//                               article.description.toString(),
//                               style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.grey[600],
//                                   fontWeight: FontWeight.bold),
//                             ),

//                             Divider(
//                               thickness: 3,
//                               color: Colors.black,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ); // Hide when a category is selected
//         }),
//       ],
//     );
//   }
// }

import 'package:awaaz360_news/Exceptions/InternetExceptions.dart';
import 'package:awaaz360_news/Resources/Components/ReUsableContainer.dart';
import 'package:awaaz360_news/Resources/Constants/GNews_HomeScreen_Color.dart';
import 'package:awaaz360_news/Services/News_Services.dart';
import 'package:awaaz360_news/View/News_Home_Screen/Widgets/Tab1_Widgets/Date_And_Time.dart';
import 'package:awaaz360_news/View/News_Home_Screen/Widgets/Tab1_Widgets/SportsGNews.dart';
import 'package:awaaz360_news/View/News_Home_Screen/Widgets/Tab2_Widgets/Search_And_Category.dart';
import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  // Widget _Tab2Content() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 10,
//         ),

//         Obx(() {
//           return Center(
//             // Centering the entire search area
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Search Icon
//                 if (!_gNews_Service_Controller.isCountrySearchActive
//                     .value) // Show only when search is inactive
//                   IconButton(
//                     icon: Icon(Icons.search,
//                         size:
//                             40), // Make the search icon slightly larger if needed
//                     onPressed: _gNews_Service_Controller
//                         .toggleCountrySearch, // Toggle search bar on click
//                   ),

//                 // Animated TextField
//                 AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   height: 50,
//                   width: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? 200.0
//                       : 0.0,
//                   curve: Curves.easeInOut,
//                   child: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? TextField(
//                           onChanged: (value) {
//                             _gNews_Service_Controller.searchCountry.value =
//                                 value;
//                           },
//                           decoration: InputDecoration(
//                             hintText: 'Enter Country code... us uk pk ',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                           ),
//                         )
//                       : null, // Hide TextField when inactive
//                 ),

//                 // Animated Button
//                 AnimatedOpacity(
//                   opacity: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? 1.0
//                       : 0.0,
//                   duration: Duration(milliseconds: 300),
//                   child: _gNews_Service_Controller.isCountrySearchActive.value
//                       ? IconButton(
//                           onPressed: () {
//                             _gNews_Service_Controller.searchAndSelectCountry(
//                                 _gNews_Service_Controller.searchCountry.value);
//                           },
//                           icon: Icon(Icons.search))
//                       : null, // Hide Button when inactive
//                 ),
//               ],
//             ),
//           );
//         }),

//         SizedBox(
//           height: 20,
//         ),
//         // Category selector that opens a full-screen dialog
//         GestureDetector(
//           onTap: () {
//             Get.dialog(
//               Scaffold(
//                 backgroundColor: Color(0xff1D1E1D),
//                 appBar: AppBar(
//                   backgroundColor: Color(0xff1D1E1D),
//                   centerTitle: true,
//                   title: Text(
//                     'Select Category',
//                     style: TextStyle(
//                       fontFamily: GnewsHomescreenColor.App_FontFamily,
//                       color: Colors.white,
//                     ),
//                   ),
//                   automaticallyImplyLeading: false,
//                   actions: [
//                     IconButton(
//                       icon: Icon(Icons.close, color: Colors.white),
//                       onPressed: () => Get.back(),
//                     )
//                   ],
//                 ),
//                 body: ListView(
//                   children: _gNews_Service_Controller.categories
//                       .map((String category) {
//                     return ListTile(
//                       title: Text(
//                         category,
//                         style: TextStyle(
//                           fontFamily: GnewsHomescreenColor.App_FontFamily,
//                           fontSize: 35,
//                           color: Colors.white,
//                         ),
//                       ),
//                       onTap: () {
//                         _gNews_Service_Controller.selectCategory(category);
//                         Get.back(); // Close the dialog after selection
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               barrierDismissible: true,
//             );
//           },
//           child: Center(
//             child: Container(
//               height: 55,
//               width: 200,
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               // Wrapping this section in Obx to listen for changes in selectedItem
//               child: Obx(() {
//                 return Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       _gNews_Service_Controller
//                               .selectedCategory.value.isNotEmpty
//                           ? _gNews_Service_Controller.selectedCategory.value
//                           : 'Select Category',
//                       style: TextStyle(
//                         fontFamily: GnewsHomescreenColor.App_FontFamily,
//                         fontSize: 18,
//                       ),
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       size: 40,
//                     ),
//                   ],
//                 );
//               }),
//             ),
//           ),
//         ),

// // Country search bar with animation

// // Conditional text display based on category selection
//         Obx(() {
//           return _gNews_Service_Controller.searchCountry.value == ''
//               ? Expanded(
//                   child: Center(
//                     child: Text(
//                       '      All \n    news \n   around \n the world',
//                       style: TextStyle(
//                         fontFamily: GnewsHomescreenColor.App_FontFamily,
//                         fontSize: 45,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )
//               : Expanded(
//                   child: ListView.builder(
//                     itemCount: _gNews_Service_Controller.articles.length,
//                     itemBuilder: (context, index) {
//                       final article = _gNews_Service_Controller.articles[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 8.0,
//                             horizontal: 16.0), // Optional padding for spacing
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment
//                               .start, // Align to the start of the column
//                           children: [
//                             // Row for title and image
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment
//                                   .start, // Align the text and image to the top
//                               children: [
//                                 // Title Text
//                                 Expanded(
//                                   child: Column(
//                                     //   mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           _gNews_Service_Controller.LaunchUrl2(
//                                               Uri.parse(
//                                                   article.url.toString()));
//                                         },
//                                         child: Text(
//                                           article.title.toString(),
//                                           style: TextStyle(
//                                             fontSize: 20.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                       Text(
//                                         article.publishedAt.toString(),
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Text(
//                                         article.source!.name.toString(),
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 // Article Image
//                                 InkWell(
//                                   onTap: () {
//                                     _gNews_Service_Controller.LaunchUrl2(
//                                         Uri.parse(article.url.toString()));
//                                   },
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: SizedBox(
//                                       width:
//                                           120.0, // Set a fixed width for the image
//                                       height:
//                                           170.0, // Set a fixed height for the image
//                                       child: article.title != null
//                                           ? Image.network(
//                                               article.image.toString(),
//                                               fit: BoxFit.cover,
//                                             )
//                                           : Placeholder(), // Display placeholder if no image is available
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             // Description below the Row
//                             SizedBox(
//                                 height:
//                                     8.0), // Add some spacing between the Row and description
//                             Text(
//                               article.description.toString(),
//                               style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.grey[600],
//                                   fontWeight: FontWeight.bold),
//                             ),

//                             Divider(
//                               thickness: 3,
//                               color: Colors.black,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ); // Hide when a category is selected
//         }),
//       ],
//     );
//   }
// }


//Widget _DateTime_And_ScrollPic_Widget() {
  // return Obx(() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.max,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // If there are no articles, display a loading indicator
  //       if (_gNews_Service_Controller.articles2a.isEmpty)
  //         Center(child: CircularProgressIndicator()),

  //       // Else, show the PageView with images and truncated headlines
  //       if (_gNews_Service_Controller.articles2a.isNotEmpty)
  //         Row(
  //           children: [
  //             Padding(
  //               padding:
  //                   const EdgeInsets.all(8.0), // Add some padding for spacing
  //               child: Text.rich(
  //                 TextSpan(
  //                   children: [
  //                     TextSpan(
  //                       text: _gNews_Service_Controller.currentDateTime
  //                           .split('\n')[0], // Display date
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.normal,
  //                         fontFamily: GnewsHomescreenColor.App_FontFamily,
  //                       ),
  //                     ),
  //                     TextSpan(
  //                       text: "\nWelcome",
  //                       style: TextStyle(
  //                         fontSize: 26,
  //                         fontWeight: FontWeight.bold,
  //                         fontFamily: GnewsHomescreenColor.App_FontFamily,
  //                       ),
  //                     ),
  //                     TextSpan(
  //                       text:
  //                           "\nGood ${_gNews_Service_Controller.currentDateTime.split('\n')[1]}", // Display time of day
  //                       style: TextStyle(
  //                         fontSize: 26,
  //                         fontWeight: FontWeight.bold,
  //                         fontFamily: GnewsHomescreenColor.App_FontFamily,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               width: 40,
  //             ),
  //             Icon(
  //               Icons.public,
  //               size: 100,
  //             )
  //           ],
  //         ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       if (_gNews_Service_Controller.articles2a.isEmpty)
  //         // Center(child: CircularProgressIndicator()),
  //         // Skeleton loader with Shimmer effect
  //         Shimmer.fromColors(
  //           baseColor: Colors.grey[300]!,
  //           highlightColor: Colors.grey[100]!,
  //           child: Column(
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.9,
  //                 height: 220,
  //                 margin: EdgeInsets.symmetric(vertical: 10),
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //               ),
  //               SizedBox(height: 10),
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.5,
  //                 height: 20,
  //                 color: Colors.white,
  //               ),
  //             ],
  //           ),
  //         ),

  //       // Else, show the PageView with images and truncated headlines
  //       if (_gNews_Service_Controller.articles2a.isNotEmpty)
  //         Padding(
  //           padding: const EdgeInsets.only(left: 10.0),
  //           child: Material(
  //             borderRadius: BorderRadius.circular(5),
  //             elevation: 20,
  //             color: const Color.fromARGB(185, 255, 255, 255),
  //             child: ReUsable_Container(
  //               width: 120,
  //               color: Theme.of(context).cardColor,
  //               radius: BorderRadius.circular(5),
  //               child: Center(
  //                 child: Text(
  //                   'Trending',
  //                   style: TextStyle(
  //                     fontSize: 25,
  //                     fontWeight: FontWeight.bold,
  //                     fontFamily: GnewsHomescreenColor.App_FontFamily,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       SizedBox(
  //         height: 35,
  //       ),

  //       Center(
  //         child: Obx(() {
  //           // Using Obx to update the UI when the article list changes
  //           if (_gNews_Service_Controller.articles2a.isEmpty) {
  //             return CircularProgressIndicator(); // Show a loader until articles are fetched
  //           } else {
  //             return CarouselSlider(
  //               items: _gNews_Service_Controller.articles2a.map((article) {
  //                 return Builder(
  //                   builder: (BuildContext context) {
  //                     return Stack(
  //                       children: [
  //                         // Image from article
  //                         InkWell(
  //                           onTap: () {
  //                             _gNews_Service_Controller.LaunchUrl2(
  //                                 Uri.parse(article.url.toString()));
  //                           },
  //                           child: Container(
  //                             width: MediaQuery.of(context).size.width,
  //                             height: 220,
  //                             margin: EdgeInsets.symmetric(horizontal: 5.0),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(
  //                                   20), // Optional border radius
  //                               image: DecorationImage(
  //                                 image: NetworkImage(article.image
  //                                     .toString()), // Assuming article has an imageUrl field
  //                                 fit: BoxFit
  //                                     .cover, // Adjust to cover the whole container
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         // Title overlay on the image
  //                         Positioned(
  //                           top: 130.0, // Positioning text at the bottom
  //                           left: 10.0, // Align text to the left
  //                           right: 10.0, // Align text to the right
  //                           child: Container(
  //                             padding: EdgeInsets.symmetric(
  //                                 vertical: 10.0, horizontal: 15.0),
  //                             decoration: BoxDecoration(
  //                               color: Colors
  //                                   .black54, // Semi-transparent background for text
  //                               borderRadius: BorderRadius.circular(10),
  //                             ),
  //                             child: Text(
  //                               _gNews_Service_Controller.truncateHeadline(article
  //                                   .title
  //                                   .toString()), // Assuming article has a title field
  //                               style: TextStyle(
  //                                   color: Colors.white, // Text color
  //                                   fontSize: 18.0, // Font size
  //                                   fontWeight: FontWeight.bold,
  //                                   fontFamily:
  //                                       GnewsHomescreenColor.App_FontFamily),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     );
  //                   },
  //                 );
  //               }).toList(),
  //               options: CarouselOptions(
  //                 height: 200.0,
  //                 autoPlay: true, // Enable auto-play
  //                 autoPlayInterval:
  //                     Duration(seconds: 6), // Auto-play interval
  //                 enlargeCenterPage: true, // Center the image in the view
  //                 aspectRatio: 16 / 9, // Adjust aspect ratio
  //                 viewportFraction:
  //                     0.8, // Width of the image relative to the screen
  //               ),
  //             );
  //           }
  //         }),
  //       )
  //     ],
  //   );
  // });
  // }

  // Widget _SportsGNews() {
  //   _gNews_Service_Controller.getGNews2();
  //   return Obx(() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           height: 30,
  //         ),
  //         if (_gNews_Service_Controller.articles2.isEmpty)
  //           Center(child: CircularProgressIndicator()),
  //         if (_gNews_Service_Controller.articles2.isNotEmpty)
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10.0),
  //             child: Material(
  //               borderRadius: BorderRadius.circular(5),
  //               elevation: 20,
  //               color: const Color.fromARGB(185, 255, 255, 255),
  //               child: ReUsable_Container(
  //                 width: 100,
  //                 color: Theme.of(context).cardColor,
  //                 radius: BorderRadius.circular(5),
  //                 child: Center(
  //                   child: Text(
  //                     'Sports',
  //                     style: TextStyle(
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       fontFamily: GnewsHomescreenColor.App_FontFamily,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         SizedBox(
  //           height: 30,
  //         ),
  //         IntrinsicHeight(
  //           child: SizedBox(
  //             height: 400, // Adjust the height if needed
  //             child: ListView.builder(
  //               itemCount: _gNews_Service_Controller.articles2.length,
  //               itemBuilder: (context, index) {
  //                 final article = _gNews_Service_Controller.articles2[index];
  //                 return Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
  //                   child: IntrinsicHeight(
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment
  //                           .start, // Align text and image at the top
  //                       children: [
  //                         VerticalDivider(
  //                           //  indent: 20,
  //                           // endIndent: 20,
  //                           color: Theme.of(context).colorScheme.secondary,
  //                           thickness: 4,
  //                         ),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Expanded(
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               InkWell(
  //                                 onTap: () {
  //                                   _gNews_Service_Controller.LaunchUrl2(
  //                                       Uri.parse(article.url.toString()));
  //                                 },
  //                                 child: Center(
  //                                   child: Text(
  //                                     article.title.toString(),
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       fontWeight: FontWeight.w500,
  //                                       fontFamily:
  //                                           GnewsHomescreenColor.App_FontFamily,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 height: 15,
  //                               ),
  //                               Text(article.source!.name.toString()),
  //                               SizedBox(
  //                                 height: 15,
  //                               ),
  //                               Text(article.publishedAt.toString())
  //                             ],
  //                           ),
  //                         ),
  //                         SizedBox(width: 20), // Spacing between image and text
  //                         // Image part
  //                         InkWell(
  //                           onTap: () {
  //                             _gNews_Service_Controller.LaunchUrl2(
  //                                 Uri.parse(article.url.toString()));
  //                           },
  //                           child: Material(
  //                             borderRadius: BorderRadius.circular(20),
  //                             elevation: 20,
  //                             child: ClipRRect(
  //                               borderRadius: BorderRadius.circular(20),
  //                               child: Center(
  //                                 child: Image.network(
  //                                   article.image ??
  //                                       "https://via.placeholder.com/150", // Fallback image
  //                                   fit: BoxFit.cover,
  //                                   width: 120, // Set image width
  //                                   height: 250, // Set image height
  //                                   errorBuilder: (context, error, stackTrace) {
  //                                     return Container(
  //                                       width: 120,
  //                                       height: 140,
  //                                       color: Colors.grey,
  //                                       child: Center(
  //                                         child: Icon(
  //                                           Icons.error,
  //                                           color: Colors.red,
  //                                           size: 50,
  //                                         ),
  //                                       ),
  //                                     );
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     );
  //   });
  // }
