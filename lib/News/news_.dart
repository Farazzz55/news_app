
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/News/news_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../model/SourceResponse.dart';
import 'news_item.dart';

class News extends StatefulWidget{
  Sources source ;
  News({required this.source});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  int currentPage = 1;
  int totalPages = 1;
  int itemsPerPage = 100;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsSource(widget.source.id??"");
  }
  NewsViewModel viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> viewModel ,
    child: Consumer<NewsViewModel>(builder: (context , viewModel, child){
      if(viewModel.errorMessage!=null){
        return Column(
          children: [
            Text(viewModel.errorMessage!),
            ElevatedButton(onPressed: (){
              viewModel.getNewsSource(widget.source.id??'');

            }, child: Text('Try agin'))
          ],
        );
      } else if(viewModel.newsList==null){
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryLight,
          ),
        );
      } else  {
        return ListView.builder(itemBuilder: (context,index){
          if (index == viewModel.newsList!.length) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  viewModel.loadMoreData(widget.source.id ?? '');
                },
                child: viewModel.isLoadingMore
                    ? CircularProgressIndicator(color: AppColors.primaryLight)
                    : Text('Load More'),
              ),
            );
          } else {
            return NewsItem(news: viewModel.newsList![index]);
          }


        },
            itemCount:viewModel.newsList!.length + 1);

      }
    }),
    );

  }

 }

/*
    return FutureBuilder<NewsResponse?>(future: ApiManager.getNewsBySourceid(widget.source.id??''),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLight,
              ),

            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceid(widget.source.id??'');

                }, child: Text('Try agin'))
              ],

            );
          }
          if(snapshot.data!.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceid(widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try again'))
              ],
            );

          }
          var newsList=snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length);



        });
*/
