// class NewsUrls {
//   static String NewsApiKey = '8f06aa3818e90544f80744fcfe243f03';

//   static String? NewsUrl_GNews(String Country, String Category) {
//     return 'https://gnews.io/api/v4/top-headlines?country=$Country&category=$Category&apikey=${NewsApiKey}';
//   }
// }

class NewsUrls {
  static String NewsApiKey = '<Your_API_Key>';
  static String NewsApiKey2 = '<Your_API_Key>';
  static String? NewsUrl_GNews(String Country, String Category) {
    return 'https://gnews.io/api/v4/top-headlines?country=$Country&category=$Category&apikey=${NewsApiKey}';
  }
}
