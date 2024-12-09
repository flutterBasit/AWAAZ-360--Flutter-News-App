import 'package:awaaz360_news/Resources/Constants/GNews_HomeScreen_Color.dart';
import 'package:awaaz360_news/View_Model/HomeViewModel_Controller/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tab2_Content extends StatelessWidget {
  const Tab2_Content({super.key});

  @override
  Widget build(BuildContext context) {
    GNews_Service_Controller gNews_Service_Controller =
        Get.put(GNews_Service_Controller());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),

        Obx(() {
          return Center(
            // Centering the entire search area
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Search Icon
                if (!gNews_Service_Controller.isCountrySearchActive
                    .value) // Show only when search is inactive
                  IconButton(
                    icon: Icon(Icons.search,
                        size:
                            40), // Make the search icon slightly larger if needed
                    onPressed: gNews_Service_Controller
                        .toggleCountrySearch, // Toggle search bar on click
                  ),

                // Animated TextField
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 50,
                  width: gNews_Service_Controller.isCountrySearchActive.value
                      ? 200.0
                      : 0.0,
                  curve: Curves.easeInOut,
                  child: gNews_Service_Controller.isCountrySearchActive.value
                      ? TextField(
                          onChanged: (value) {
                            gNews_Service_Controller.searchCountry.value =
                                value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Country code... us uk pk ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )
                      : null, // Hide TextField when inactive
                ),

                // Animated Button
                AnimatedOpacity(
                  opacity: gNews_Service_Controller.isCountrySearchActive.value
                      ? 1.0
                      : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: gNews_Service_Controller.isCountrySearchActive.value
                      ? IconButton(
                          onPressed: () {
                            gNews_Service_Controller.searchAndSelectCountry(
                                gNews_Service_Controller.searchCountry.value);
                          },
                          icon: Icon(Icons.search))
                      : null, // Hide Button when inactive
                ),
              ],
            ),
          );
        }),

        SizedBox(
          height: 20,
        ),
        // Category selector that opens a full-screen dialog
        GestureDetector(
          onTap: () {
            Get.dialog(
              Scaffold(
                backgroundColor: Color(0xff1D1E1D),
                appBar: AppBar(
                  backgroundColor: Color(0xff1D1E1D),
                  centerTitle: true,
                  title: Text(
                    'Select Category',
                    style: TextStyle(
                      fontFamily: GnewsHomescreenColor.App_FontFamily,
                      color: Colors.white,
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Get.back(),
                    )
                  ],
                ),
                body: ListView(
                  children: gNews_Service_Controller.categories
                      .map((String category) {
                    return ListTile(
                      title: Text(
                        category,
                        style: TextStyle(
                          fontFamily: GnewsHomescreenColor.App_FontFamily,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        gNews_Service_Controller.selectCategory(category);
                        Get.back(); // Close the dialog after selection
                      },
                    );
                  }).toList(),
                ),
              ),
              barrierDismissible: true,
            );
          },
          child: Center(
            child: Container(
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(30),
              ),
              // Wrapping this section in Obx to listen for changes in selectedItem
              child: Obx(() {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      gNews_Service_Controller.selectedCategory.value.isNotEmpty
                          ? gNews_Service_Controller.selectedCategory.value
                          : 'Select Category',
                      style: TextStyle(
                        fontFamily: GnewsHomescreenColor.App_FontFamily,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 40,
                    ),
                  ],
                );
              }),
            ),
          ),
        ),

// Country search bar with animation

// Conditional text display based on category selection
        Obx(() {
          return gNews_Service_Controller.searchCountry.value == ''
              ? Expanded(
                  child: Center(
                    child: Text(
                      '      All \n    news \n   around \n the world',
                      style: TextStyle(
                        fontFamily: GnewsHomescreenColor.App_FontFamily,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: gNews_Service_Controller.articles.length,
                    itemBuilder: (context, index) {
                      final article = gNews_Service_Controller.articles[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0), // Optional padding for spacing
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align to the start of the column
                          children: [
                            // Row for title and image
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align the text and image to the top
                              children: [
                                // Title Text
                                Expanded(
                                  child: Column(
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          gNews_Service_Controller.LaunchUrl2(
                                              Uri.parse(
                                                  article.url.toString()));
                                        },
                                        child: Text(
                                          article.title.toString(),
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        article.publishedAt.toString(),
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        article.source!.name.toString(),
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Article Image
                                InkWell(
                                  onTap: () {
                                    gNews_Service_Controller.LaunchUrl2(
                                        Uri.parse(article.url.toString()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width:
                                          120.0, // Set a fixed width for the image
                                      height:
                                          170.0, // Set a fixed height for the image
                                      child: article.title != null
                                          ? Image.network(
                                              article.image.toString(),
                                              fit: BoxFit.cover,
                                            )
                                          : Placeholder(), // Display placeholder if no image is available
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Description below the Row
                            SizedBox(
                                height:
                                    8.0), // Add some spacing between the Row and description
                            Text(
                              article.description.toString(),
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),

                            Divider(
                              thickness: 3,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ); // Hide when a category is selected
        }),
      ],
    );
  }
}
