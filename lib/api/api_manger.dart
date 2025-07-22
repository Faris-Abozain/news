import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/moduels/models/news_response.dart';

import '../moduels/models/source_response.dart';

class ApiManger {
  static Future<SourceResponse?> getSources(String CategoryId) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=0398faef9ee84213b940ebdfe935a566"));
    try {
      var bodyString = response.body; //string
      var json = jsonDecode(bodyString); //json
      return SourceResponse.fromJson(json); //object
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNews(String sourceId) async {
   var response=await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=0398faef9ee84213b940ebdfe935a566",));
 try{
   var responseBody=response.body;
   var json =jsonDecode(responseBody);
   return NewsResponse.fromJson(json);
 }catch(e){
   throw e;
 }
  }
}
