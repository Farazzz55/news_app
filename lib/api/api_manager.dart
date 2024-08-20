import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_flutterproject/api/api_constant.dart';
import 'package:news_flutterproject/model/NewsResponse.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';
class ApiManager{
 ///https://newsapi.org/v2/top-headlines/sources?apiKey=6e9751459b4d4a3282e42f5c323566ed
  ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=6e9751459b4d4a3282e42f5c323566ed
  static Future <SourceResponse?>getSource(String categoryId)async{
    Uri url = Uri.https(ApiConstant.url_base,ApiConstant.sourceApi,// name of server , name of Api
        {
      'apiKey' : '6e9751459b4d4a3282e42f5c323566ed',
       'category' : categoryId ,
        });
    var response = await http.get(url);
    try{
      var responseBody = response.body;
      var json=jsonDecode(responseBody);
      return SourceResponse.fromJson(json);

    }
    catch (e){
      throw e;
    }


  }


  static Future<NewsResponse?> getNewsBySourceid(String sourceId,{int page = 1, int pageSize = 10}) async{
    Uri url = Uri.https(ApiConstant.url_base,ApiConstant.NewsApi,{
      'apiKey':'6e9751459b4d4a3282e42f5c323566ed',
      'sources' : sourceId,
      'page': page.toString(), // Page number for pagination
      'pageSize': pageSize.toString(), // Limit news items per request
    });
    var response = await http.get(url);
    try{
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch(e){
      throw e;

    }

  }
}