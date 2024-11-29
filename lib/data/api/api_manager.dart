import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_response/ArticlesResponse.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';
//https://newsapi.org/v2/top-headlines/sources?apiKey=32bb2789562b45118686a6b8c01f9dcf
//https://newsapi.org/v2/everything?apiKey=32bb2789562b45118686a6b8c01f9dcf&source=abc-news

class ApiManager{
  static const String _baseUrl = 'newsapi.org';
  static const String _sourcesEndPoint = '/v2/top-headlines/sources';
  static const String _articlesEndPoint = 'v2/everything';
  static const String _apiKey = '32bb2789562b45118686a6b8c01f9dcf';


 static Future<SourcesResponse> getSources(String categoryId) async{
   Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {'apiKey': _apiKey, 'category' : categoryId}, );
   var serverResponse = await http.get(url);
   var json = jsonDecode(serverResponse.body);
   SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
   return sourcesResponse;
  }


  static Future<ArticlesResponse> getArticles(String sourceId,) async{
   Uri url = Uri.https(_baseUrl, _articlesEndPoint, {'apiKey': _apiKey, 'sources' : sourceId,},);
   var serverResponse = await http.get(url);
   var json = jsonDecode(serverResponse.body);
   ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
   return articlesResponse;
  }

  static Future<ArticlesResponse> search(String searchText, ) async{
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, {'apiKey': _apiKey, 'q' : searchText,},);
    var serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}