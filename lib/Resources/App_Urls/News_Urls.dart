// class NewsUrls {
//   static String NewsApiKey = '8f06aa3818e90544f80744fcfe243f03';

//   static String? NewsUrl_GNews(String Country, String Category) {
//     return 'https://gnews.io/api/v4/top-headlines?country=$Country&category=$Category&apikey=${NewsApiKey}';
//   }
// }

class NewsUrls {
  static String NewsApiKey = '8f06aa3818e90544f80744fcfe243f03';
  static String NewsApiKey2 = '517fc3307caa9555c516f957ae3ee9bf';
  static String? NewsUrl_GNews(String Country, String Category) {
    return 'https://gnews.io/api/v4/top-headlines?country=$Country&category=$Category&apikey=${NewsApiKey}';
  }
}
