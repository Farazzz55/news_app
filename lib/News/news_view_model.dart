import 'package:flutter/material.dart';
import 'package:news_flutterproject/News/news_navigator.dart';
import 'package:news_flutterproject/api/api_manager.dart';
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


  void getNewsSource(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceid(
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
      var newsResponse = await ApiManager.getNewsBySourceid(
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

  void selectTab(int index, String sourceId) {
    selectedIndex = index;
    getNewsSource(sourceId);
    notifyListeners();
  }
}