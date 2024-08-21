
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/News/cubit/news_state.dart';
import 'package:news_flutterproject/News/cubit/news_view_model.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }
  NewsViewModel viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> viewModel ,
        child: BlocBuilder<NewsViewModel , NewsState>(
            builder: (context , state) {
              if(state is LoadingState){
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLight,
                  ),
                );
              } else if (state is ErrorState){
                return Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: (){
                          viewModel.getNewsBySourceId(widget.source.id!);
                    }, child: Text('Try agin'))
                  ],

                );
              } else if(state is SuccessState){
                return ListView.builder(itemBuilder: (context,index){
                  return NewsItem(news: state.newsList[index]);
                },
                    itemCount: state.newsList.length);
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryLight,
                ),
              );
            }),


    );

  }
}



/*return FutureBuilder<NewsResponse?>
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



        });*/