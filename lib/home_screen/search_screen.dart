import 'package:flutter/material.dart';

import '../AppColors.dart';

class SearchScreen extends StatelessWidget{
  @override
  static String routeName = 'SearchScreen';
  Widget build(BuildContext context) {
    return Stack(
      children:[ Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.primaryLight
          ),
        ),
        body: Column(
          children: [

          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(22),
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.05,
        decoration: BoxDecoration(
        color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(100)
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }
              , icon:Icon(Icons.close, size: 30, color:  AppColors.primaryLight,)),
            IconButton(onPressed: (){}
                , icon:Icon(Icons.search, size: 30, color:  AppColors.primaryLight,)),
          ])),
      ),

      ]);
  }
  void Search(){

  }

}
