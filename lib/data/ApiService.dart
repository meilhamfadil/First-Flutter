import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "https://newsapi.org/v2/";

  Future<http.StreamedResponse> fetchNews() async {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request(
        'GET',
        Uri.parse(baseUrl +
            'everything?q=bitcoin&from=2019-12-31&sortBy=publishedAt&apiKey=6cbe6cca47934d6790fb84121ae9fa54')));
    return streamedRest;
  }
}
