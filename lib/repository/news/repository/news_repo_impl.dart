import 'package:news_flutterproject/model/NewsResponse.dart';
import 'package:news_flutterproject/repository/news/news_data_source.dart';
import 'package:news_flutterproject/repository/news/news_repo.dart';

class NewsRepoImpl implements NewsRepo{
  @override
  NewsRemoteDataSource remoteDataSource;
  NewsRepoImpl({required this.remoteDataSource});
  Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10 }) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
   
}