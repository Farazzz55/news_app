import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutterproject/News/cubit/news_state.dart';
import 'package:news_flutterproject/api/api_manager.dart';

class NewsViewModel extends Cubit<NewsState>{
  NewsViewModel():super(LoadingState());
  void getNewsBySourceId(String sourceId)async{
   try{
     emit(LoadingState());
     var response =await ApiManager.getNewsBySourceid(sourceId);
     if(response?.status=='error'){
       emit(ErrorState(errorMessage: response!.message!));
       return ;
     } if(response?.status=='ok'){
       emit(SuccessState(newsList: response!.articles!));
     }

  } catch(e){
     emit(ErrorState(errorMessage: e.toString()));
   }
  }
}