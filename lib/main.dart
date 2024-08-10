import 'package:flutter/material.dart';
import 'package:news_flutterproject/home_screen/home_screen.dart';
import 'package:news_flutterproject/myThemeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen()
      },
       initialRoute:HomeScreen.routeName ,
      theme: MyThemeData.lightTheme,
    );
  }
}

