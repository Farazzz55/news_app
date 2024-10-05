import 'package:news_flutterproject/model/NewsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse?>getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10 });
}