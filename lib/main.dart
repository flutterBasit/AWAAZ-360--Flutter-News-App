import 'package:awaaz360_news/Resources/Routes/Routes.dart';
import 'package:awaaz360_news/View/SplashScreen/Splash_Screen.dart';
import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';
import 'package:awaaz360_news/View_Model/Theme_Controller/Theme_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // await GetStorage.init(); // Initialize GetStorage
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage

  // Check stored theme preference and apply initial theme accordingly
  final initialThemeIsDark = GetStorage().read('isDarkTheme') ?? false;

  runApp(MyApp(initialThemeIsDark: initialThemeIsDark));
}

class MyApp extends StatelessWidget {
  bool? initialThemeIsDark = false;
  MyApp({super.key, this.initialThemeIsDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GNews_Service_Controller gNews_Service_Controller =
        Get.put(GNews_Service_Controller());

// Set initial theme based on GetStorage value before any toggle actions
    gNews_Service_Controller.isDarkTheme.value = initialThemeIsDark!;

    return Obx(() {
      return GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: gNews_Service_Controller.isDarkTheme.value
            ? ThemeMode.dark
            : ThemeMode.light,
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes(),
      );
    });
  }
}
