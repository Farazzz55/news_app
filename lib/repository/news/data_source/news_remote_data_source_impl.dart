import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/model/NewsResponse.dart';
import 'package:news_flutterproject/repository/news/news_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10 }) async {
    var response = await apiManager.getNewsBySourceid(sourceId);
    return response;
  }

}