import 'package:flutter/material.dart';
import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';
import 'package:news_flutterproject/repository/sources/source_data_source.dart';
import 'package:news_flutterproject/repository/sources/source_repo.dart';

import '../../repository/sources/data_source/source_remote_data_source_impl.dart';
import '../../repository/sources/repository/source_repo_impl.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  late SourceRepo sourceRepo;
  late SourceRemoteDataSource remoteDataSource;
  late ApiManager apiManager;
  CategoryDetailsViewModel(){
    apiManager=ApiManager();
    remoteDataSource= SourceRemoteDataSourceImpl(apiManager:apiManager );
    sourceRepo = SourceRepoImpl(remoteDataSource: remoteDataSource);
  }
 List <Sources> ?  sourcesList;
 String ?errorMessage;
 void getSources (String categoryId) async{
   sourcesList=null;
   errorMessage=null;
   notifyListeners();
   try {var response = await sourceRepo.getSources(categoryId);
     if(response?.status=='error'){
       errorMessage=response!.message;
     } else{
       sourcesList=response!.sources;
     }
   }
   catch(e){
        errorMessage = e.toString();
   }
   notifyListeners();
 }
}