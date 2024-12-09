// import 'package:awaaz360_news/Model/Model_Article.dart';
// import 'package:awaaz360_news/Resources/App_Urls/News_Urls.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class GNews_Service_Controller extends GetxController {
//   final Dio dio = Dio();
//   //list of articles
//   RxList<Articles> articles = <Articles>[].obs;

// //already selected country and the category
//   var selectedCountry = 'pk'.obs;
//   var selectedCategory = 'general'.obs;
//   //using Dio for the http get request for fetching the data
//   Future<void> getGNews() async {
//     final String? url = NewsUrls.NewsUrl_GNews(
//         selectedCountry.toString(), selectedCategory.toString());
//     try {
//       final response = await dio.get(url!);
//       final articlesJson = response.data["articles"] as List;
//       print(articlesJson);

//       articles.assignAll(
//         articlesJson.map((a) => Articles.fromJson(a)).toList(),
//       );
//       List<Articles> GNewsArticles_Filtered =
//           articles.where((a) => a.title != "[Removed]").toList();
//       articles.assignAll(GNewsArticles_Filtered);
//       print(articles);
//     } catch (e) {
//       print("Error fetching news: $e");
//     }
//   }

//   Future<void> LaunchUrl(Uri url) async {
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch $url');
//     }
//   }
// }

import 'dart:async';
import 'dart:io';

import 'package:awaaz360_news/Model/Model_Article.dart';
import 'package:awaaz360_news/Resources/App_Urls/News_Urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class GNews_Service_Controller extends GetxController {
  final Dio dio = Dio();

  // This is for Chossing the navigation bar
// Use an RxInt to observe changes in the selected index
  var selectedIndex = 0.obs;

  // Function to change the tab index
  void changeTab(int index) {
    selectedIndex.value = index;
  }

//4518
//This is for drop down
  var selectedItem = ''.obs;

  void selectItem(String item) {
    selectedItem.value = item;
    Get.back(); // Close the dropdown overlay
  }

// List of available countries and categories
  final List<String> countries = ['us', 'pk', 'ind', 'uk', 'ca'];
  final List<String> categories = [
    'general',
    'sports',
    'health',
    'business',
    'entertainment',
    'weather'
  ];

// Selected country and category (default to 'pk' and 'general')
  var selectedCountry = ''.obs;
  var selectedCategory = ''.obs;

  RxList<Articles> articles = <Articles>[].obs;

  var hasInternetError = false.obs; // Track internet error

// thats the function for the Tab2 search and category
// Fetch news using Dio
  Future<void> getGNews() async {
    final String? url =
        NewsUrls.NewsUrl_GNews(selectedCountry.value, selectedCategory.value);

    if (url == null) {
      print("Error: URL is null");
      return;
    }

    try {
      final response = await dio.get(url);
      final articlesJson = response.data["articles"] as List;
      hasInternetError.value = false;
      if (kDebugMode) {
        print(articlesJson);
      }

      articles.assignAll(
        articlesJson.map((a) => Articles.fromJson(a)).toList(),
      );

      // Filter out any removed articles
      List<Articles> GNewsArticles_Filtered =
          articles.where((a) => a.title != "[Removed]").toList();

      articles.assignAll(GNewsArticles_Filtered);
      if (kDebugMode) {
        print(articles);
      }
    } on DioError catch (e) {
      // Handle Dio-specific errors
      hasInternetError.value = true;
      Get.snackbar('Internet Exception', 'Check your internet connection',
          backgroundColor: Colors.white60, snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print("DioError: $e");
      }
    } catch (e) {
      hasInternetError.value = true;
      Get.snackbar('Internet Exception', 'Check your internet connection',
          backgroundColor: Colors.white60, snackPosition: SnackPosition.BOTTOM);
    }
  }

// Method to update selected category
  void selectCategory(String category) {
    selectedCategory.value = category;
    getGNews(); // Fetch news based on updated category
  }

// Method to update selected country
  void selectCountry(String country) {
    selectedCountry.value = country;
    getGNews(); // Fetch news based on updated country
  }

// To track if the search is active
  var isCountrySearchActive = false.obs;

// Search term for country
  var searchCountry = ''.obs;

// Method to toggle search bar visibility
  void toggleCountrySearch() {
    isCountrySearchActive.value = !isCountrySearchActive.value;
  }

// Method to handle country search and select
  void searchAndSelectCountry(String country) {
    selectedCountry.value = country;
    getGNews(); // Fetch news based on the selected country
  }

//This is the function for the General News : on Tab1
  // List of articles
  RxList<Articles> articles2a = <Articles>[].obs;

  // Selected country and category
  var selectedCountry2a = 'pk'.obs;
  var selectedCategory2a = 'general'.obs;

  var hasInternetError2 = false.obs; // Track internet error

  // Fetch news using Dio
  Future<void> getGNews2a() async {
    final String? url = NewsUrls.NewsUrl_GNews(
        selectedCountry2a.toString(), selectedCategory2a.toString());

    if (url == null) {
      if (kDebugMode) {
        print("Error: URL is null");
      }
      return;
    }

    try {
      final response = await dio.get(url);
      final articlesJson = response.data["articles"] as List;
      hasInternetError2.value = false;
      if (kDebugMode) {
        print(articlesJson);
      }

      articles2a.assignAll(
        articlesJson.map((a) => Articles.fromJson(a)).toList(),
      );

      // Filter out any removed articles
      List<Articles> GNewsArticles_Filtered =
          articles2a.where((a) => a.title != "[Removed]").toList();

      articles2a.assignAll(GNewsArticles_Filtered);
      if (kDebugMode) {
        print(articles2a);
      }
    } on DioError catch (e) {
      // Handle Dio-specific errors
      hasInternetError2.value = true;
      Get.snackbar('Internet Exception', 'Check your internet connection',
          backgroundColor: Colors.white60, snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print("DioError: $e");
      }
    } catch (e) {
      hasInternetError2.value = true;
      Get.snackbar('Internet Exception', 'Check your internet connection',
          backgroundColor: Colors.white60, snackPosition: SnackPosition.BOTTOM);
    }
  }

//This is the function for the Sports : On the Tab1
  // List of articles
  RxList<Articles> articles2 = <Articles>[].obs;

  // Selected country and category
  var selectedCountry2 = 'pk'.obs;
  var selectedCategory2 = 'sports'.obs;

  var hasInternetError3 = false.obs; // Track internet error

  // Fetch news using Dio
  Future<void> getGNews2() async {
    final String? url = NewsUrls.NewsUrl_GNews(
        selectedCountry2.toString(), selectedCategory2.toString());

    if (url == null) {
      if (kDebugMode) {
        print("Error: URL is null");
      }
      return;
    }

    try {
      final response = await dio.get(url);
      final articlesJson = response.data["articles"] as List;
      hasInternetError3.value = false;
      if (kDebugMode) {
        print(articlesJson);
      }

      articles2.assignAll(
        articlesJson.map((a) => Articles.fromJson(a)).toList(),
      );

      // Filter out any removed articles
      List<Articles> GNewsArticles_Filtered =
          articles2.where((a) => a.title != "[Removed]").toList();

      articles2.assignAll(GNewsArticles_Filtered);
      if (kDebugMode) {
        print(articles2);
      }
    } on DioError catch (e) {
      // Handle Dio-specific errors
      hasInternetError3.value = true;
      Get.snackbar('Internet Exception', 'Check your internet connection',
          backgroundColor: Colors.white60, snackPosition: SnackPosition.BOTTOM);
      if (kDebugMode) {
        print("DioError: $e");
      }
    } catch (e) {
      hasInternetError3.value = true;
      Get.snackbar('Internet Exception', 'Check your internet connection',
          backgroundColor: Colors.white60, snackPosition: SnackPosition.BOTTOM);
    }
  }

// Launch URL within the app using in-app web view
  Future<void> LaunchUrl2(Uri url) async {
    // Use `launchUrl` with `LaunchMode.inAppWebView` to open the URL in an in-app browser
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  // // Launch URL
  // Future<void> LaunchUrl(Uri url) async {
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  // Function to get the ordinal suffix for a given day (1st, 2nd, etc.) on the Tab1
  String getOrdinalSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  // Reactive variable to hold the formatted date/time
  var currentDateTime = ''.obs;

  // Function to update the date/time with proper formatting
  void updateCurrentDateTime() {
    final now = DateTime.now();
    final hour = now.hour;

    String timeOfDay;

    if (hour >= 5 && hour < 12) {
      timeOfDay = "Morning";
    } else if (hour >= 12 && hour < 17) {
      timeOfDay = "Afternoon";
    } else {
      timeOfDay = "Evening";
    }
    // Format the day with ordinal suffix
    final int day = now.day;
    final String dayWithSuffix = '$day${getOrdinalSuffix(day)}';

    final DateFormat formatter = DateFormat('EEEE, MMM');
    String formattedDate = "${formatter.format(now)} $dayWithSuffix";

    // Update the observable value
    currentDateTime.value = "$formattedDate\n$timeOfDay";
  }

  // Helper function to truncate the headline to the first few words
  String truncateHeadline(String? title) {
    if (title == null) return "No Title";
    List<String> words = title.split(" ");
    if (words.length > 5) {
      return words.take(5).join(" ") + "....."; // Return only the first 5 words
    }
    return title;
  }

  var isDarkTheme = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Load theme preference from storage or default to false (light mode)
    isDarkTheme.value = storage.read('isDarkTheme') ?? false;
    Get.changeTheme(isDarkTheme.value ? ThemeData.dark() : ThemeData.light());
  }

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    storage.write('isDarkTheme', isDarkTheme.value); // Save preference
    Get.changeTheme(isDarkTheme.value ? ThemeData.dark() : ThemeData.light());
  }
}

//   Timer? _timer; // Timer variable
//   PageController? pageController; // PageController for scrolling

//   // Function to start auto-scrolling
//   void startAutoScroll() {
//     if (pageController != null) {
//       _timer = Timer.periodic(Duration(seconds: 8), (timer) {
//         if (articles.isNotEmpty) {
//           int nextPage = (pageController!.page?.toInt() ?? 0) + 1;
//           if (nextPage >= articles.length) {
//             nextPage = 0; // Loop back to the first page
//           }
//           pageController!.animateToPage(nextPage,
//               duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
//         }
//       });
//     }
//   }

// // Initialize the controller and PageController
//   @override
//   void onInit() {
//     super.onInit();
//     pageController =
//         PageController(viewportFraction: 0.8); // Initialize the controller
//     startAutoScroll(); // Start auto-scrolling
//     //getGNewsArticles(); // Fetch articles
//   }

//   // Dispose of the PageController and timer
//   @override
//   void onClose() {
//     stopAutoScroll(); // Stop auto-scrolling
//     pageController!.dispose(); // Dispose the PageController
//     super.onClose();
//   }

//   // Function to stop the timer when not needed
//   void stopAutoScroll() {
//     _timer?.cancel();
//   }

//   // Call this method to initialize the controller
//   void initialize(PageController controller) {
//     pageController = controller;
//     startAutoScroll();
//   }
