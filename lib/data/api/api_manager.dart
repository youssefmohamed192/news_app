import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/data/model/ArticleResponse.dart';
import 'package:news_app/data/model/sources_response.dart';

abstract class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "3d03b8562f86476ab7756e091312ef2c";

  static Future<List<Source>> getSources(String category) async {
    Uri url =
        Uri.parse("https://$baseUrl/v2/top-headlines/sources?apiKey=$apiKey&category=$category");
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

  static Future<List<Article>> getArticles(String sourceId) async {
    Uri url = Uri.https(
        baseUrl, "/v2/everything", {"apiKey": apiKey, "sources": sourceId});
    Response serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticleResponse articleResponse = ArticleResponse.fromJson(json);
    if (serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        articleResponse.articles?.isNotEmpty == true) {
      return articleResponse.articles!;
    } else {
      throw Exception("Something went wrong please try again later");
    }
  }
}
