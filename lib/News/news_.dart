
import 'package:flutter/material.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/model/NewsResponse.dart';

import '../../model/SourceResponse.dart';
import 'news_item.dart';

class News extends StatefulWidget{
  Sources source ;
  News({required this.source});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>
      (future: ApiManager.getNewsBySourceid(widget.source.id??''),
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
  }
}