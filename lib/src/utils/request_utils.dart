class RequestUtils {
  static String getFullURL(String url) {
    return 'https://api.themoviedb.org/3$url?api_key=b562e21cb6c2c0481d4eee61f5dae6d1';
  }

  static Map<String, dynamic> getBaseParams() {
    return {
      "api_key": "b562e21cb6c2c0481d4eee61f5dae6d1",
    };
  }
}
