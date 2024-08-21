
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/home_screen/category/cubit/source_state.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';

class CategoryDetailsViewModel extends Cubit<SourceState>{
  CategoryDetailsViewModel():super(SourceLoadingState()); // init state
  void getSources(String categoryId) async{
    try {
      emit(SourceLoadingState());
   var response = await ApiManager.getSource(categoryId);
   if(response?.status=='error'){
     emit(SourceErrorState(errorMessage: response!.message!));
   } if(response?.status=='ok'){
     emit(SourceSuccessState(sourcesList: response!.sources!));

      }
  } catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
}}