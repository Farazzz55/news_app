import 'package:flutter/material.dart';
import 'package:news_flutterproject/News/news_navigator.dart';
import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_flutterproject/repository/news/news_data_source.dart';
import 'package:news_flutterproject/repository/news/news_repo.dart';
import 'package:news_flutterproject/repository/news/repository/news_repo_impl.dart';
import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';

class NewsViewModel extends ChangeNotifier {
  List <News> ? newsList;
  String ? errorMessage;
  bool isLoadingMore = false;
  int currentPage = 1;
  NewsNavigator? navigator;
  int selectedIndex = 0;
  List<Sources> sources = [];
  late NewsRepo newsRepo;
  late NewsRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  NewsViewModel(){
    apiManager=ApiManager();
    remoteDataSource=NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepo=NewsRepoImpl(remoteDataSource: remoteDataSource);
  }


  void getNewsSource(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await newsRepo.getNewsBySourceId(
          sourceId, page: currentPage);
      if (response != null && response.articles != null) {
        newsList = response.articles;
      } else {
        errorMessage = 'No articles found';
      }
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        newsList = response!.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }


  void loadMoreData(String sourceId) async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    notifyListeners();
    currentPage++;
    try {
      var newsResponse = await newsRepo.getNewsBySourceId(
          sourceId, page: currentPage);
      if (newsResponse != null && newsResponse.articles != null &&
          newsResponse.articles!.isNotEmpty) {
        newsList!.addAll(newsResponse.articles!);
        isLoadingMore = false;
      } else if (newsResponse == null || newsResponse.articles == null ||
          newsResponse.articles!.isEmpty) {
        navigator?.showMyMessage('No more articles to load');
      }
    } catch (e) {
      errorMessage = e.toString();
      navigator?.showMyMessage(e.toString());
    } finally {
      isLoadingMore = false;
      notifyListeners();
    }
  }

  void getNewsBySelectTab(int index, String sourceId) {
    selectedIndex = index;
    currentPage=1;
    getNewsSource(sourceId);
    notifyListeners();
  }

  Future<void> searchNews(String sourceId, String searchTerm) async {
    try {
      var newsResponse = await newsRepo.getNewsBySourceId(sourceId);
      if (newsResponse != null && newsResponse.articles != null) {
        newsList = newsResponse.articles!.where((news) {
          final query = searchTerm.toLowerCase();
          return (news.title?.toLowerCase().contains(query) ?? false) ||
              (news.author?.toLowerCase().contains(query) ?? false) ||
              (news.publishedAt?.toLowerCase().contains(query) ?? false);
        }).toList();
        notifyListeners();
      }
    } catch (e) {
      errorMessage = 'Failed to search news';
      notifyListeners();
    }
  }

}