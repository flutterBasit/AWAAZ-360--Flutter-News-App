import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetException_Handling extends StatelessWidget {
  const InternetException_Handling({super.key});

  @override
  Widget build(BuildContext context) {
    GNews_Service_Controller _gNews_Service_Controller =
        Get.put(GNews_Service_Controller());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 80, color: Colors.redAccent),
            SizedBox(height: 16),
            Text(
              "Internet Connection Issue",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Please check your internet connection and try again.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary)),
              onPressed: () {
                _gNews_Service_Controller.getGNews(); // Retry fetching news
                _gNews_Service_Controller.getGNews2();
                _gNews_Service_Controller.getGNews2a();
              },
              child: Text(
                "Retry",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
