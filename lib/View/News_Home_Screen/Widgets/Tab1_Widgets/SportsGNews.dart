import 'package:awaaz360_news/Resources/Components/ReUsableContainer.dart';
import 'package:awaaz360_news/Resources/Constants/GNews_HomeScreen_Color.dart';
import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sports_GNews extends StatelessWidget {
  const Sports_GNews({super.key});

  @override
  Widget build(BuildContext context) {
    GNews_Service_Controller gNews_Service_Controller =
        Get.put(GNews_Service_Controller());

    gNews_Service_Controller.getGNews2();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          if (gNews_Service_Controller.articles2.isEmpty) Center(),
          if (gNews_Service_Controller.articles2.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 20,
                color: const Color.fromARGB(185, 255, 255, 255),
                child: ReUsable_Container(
                  width: 100,
                  color: Theme.of(context).cardColor,
                  radius: BorderRadius.circular(5),
                  child: Center(
                    child: Text(
                      'Sports',
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
            height: 30,
          ),
          IntrinsicHeight(
            child: SizedBox(
              height: 400, // Adjust the height if needed
              child: ListView.builder(
                itemCount: gNews_Service_Controller.articles2.length,
                itemBuilder: (context, index) {
                  final article = gNews_Service_Controller.articles2[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align text and image at the top
                        children: [
                          VerticalDivider(
                            //  indent: 20,
                            // endIndent: 20,
                            color: Theme.of(context).colorScheme.secondary,
                            thickness: 4,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    gNews_Service_Controller.LaunchUrl2(
                                        Uri.parse(article.url.toString()));
                                  },
                                  child: Center(
                                    child: Text(
                                      article.title.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            GnewsHomescreenColor.App_FontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(article.source!.name.toString()),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(article.publishedAt.toString())
                              ],
                            ),
                          ),
                          SizedBox(width: 20), // Spacing between image and text
                          // Image part
                          InkWell(
                            onTap: () {
                              gNews_Service_Controller.LaunchUrl2(
                                  Uri.parse(article.url.toString()));
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Center(
                                  child: Image.network(
                                    article.image ??
                                        "https://via.placeholder.com/150", // Fallback image
                                    fit: BoxFit.cover,
                                    width: 120, // Set image width
                                    height: 250, // Set image height
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 120,
                                        height: 140,
                                        color: Colors.grey,
                                        child: Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
