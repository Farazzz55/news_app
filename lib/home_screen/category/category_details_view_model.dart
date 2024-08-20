import 'package:flutter/material.dart';
import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
 List <Sources> ?  sourcesList;
 String ?errorMessage;
 void getSources (String categoryId) async{
   sourcesList=null;
   errorMessage=null;
   notifyListeners();
   try {var response = await ApiManager.getSource(categoryId);
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