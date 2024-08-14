import 'package:flutter/material.dart';
import 'package:news_flutterproject/AppColors.dart';

class MyThemeData{
  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.primaryLight,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft:Radius.circular(50),
          bottomRight: Radius.circular(50)
        )
      )

    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 22,
      ),
        titleMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18,
        ),
      titleSmall: TextStyle(
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        fontSize: 15
      ),
      bodySmall: TextStyle(
          fontSize: 13
      ),


    ),


  );
}