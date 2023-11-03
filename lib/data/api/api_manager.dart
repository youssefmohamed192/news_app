import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/data/model/sources_response.dart';

abstract class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "3d03b8562f86476ab7756e091312ef2c";

  static Future<List<Source>> getSources() async {
    Uri url =
        Uri.parse("https://$baseUrl/v2/top-headlines/sources?apiKey=$apiKey");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse.sources!;
    } else {
      throw Exception(sourcesResponse.message);
    }
  }

  static getArticles() {}
}
