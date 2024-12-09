import 'package:awaaz360_news/Resources/Routes/RoutesName.dart';
import 'package:awaaz360_news/View/News_Home_Screen/HomeScreen.dart';
import 'package:awaaz360_news/View/SplashScreen/Splash_Screen.dart';
import 'package:get/get.dart';

class Routes {
  static routes() => [
        GetPage(
            name: RouteName.Splash_Screen,
            page: () => SplashScreen(),
            transition: Transition.circularReveal,
            transitionDuration: Duration(seconds: 1)),
        GetPage(
            name: RouteName.Home_Screen,
            page: () => GNews_HomeScreen(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(seconds: 1))
      ];
}
