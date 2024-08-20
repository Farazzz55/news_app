import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/home_screen/category/category_details.dart';
import 'package:news_flutterproject/home_screen/category/category_fragment.dart';
import 'package:news_flutterproject/home_screen/home_drawer.dart';
import 'package:news_flutterproject/home_screen/search_screen.dart';
import 'package:news_flutterproject/model/category.dart';
import 'package:news_flutterproject/setting/setting.dart';

class HomeScreen extends StatefulWidget{
  static String routeName='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       Container(color: AppColors.whiteColor,),
       Image.asset('assets/images/pattern.png',
       fit: BoxFit.cover,
       width: double.infinity,
       height: double.infinity,),
       Scaffold(
         backgroundColor: Colors.transparent,
         appBar: AppBar(
           iconTheme: IconThemeData(color: AppColors.whiteColor),
           title: Text(selectedItemDrawer == HomeDrawer.setting ? 'Settings' :
               selectedCategory == null ?
             'News App' : '${selectedCategory!.title}',style: GoogleFonts.exo(
             textStyle:Theme.of(context).textTheme.titleLarge
           ),),
           actions: [
             if (selectedCategory!=null) Padding(padding: EdgeInsets.symmetric(
               horizontal: MediaQuery.of(context).size.width*0.05
             ),
             child: IconButton(
               onPressed: (){
                 Navigator.of(context).pushNamed(SearchScreen.routeName);
               },
                  icon:Icon(Icons.search ,size: 35,))
             )],
                ),
           drawer: Drawer(
             child:  HomeDrawer(onClickHomeDrawer: onClickDrawer ,),
           ),

           body:
               selectedItemDrawer==HomeDrawer.setting ?
                   Setting() :
           selectedCategory == null ?
           CategoryFragment(onCategoryClick: onCategoryClick,) :
               CategoryDetails(category: selectedCategory!,)
       )
     ],

   );
  }
  CategoryModel ? selectedCategory;
  void onCategoryClick(CategoryModel newCategory){
     selectedCategory = newCategory ;
     setState(() {

     });

  }

  int selectedItemDrawer=HomeDrawer.categories ;
  void onClickDrawer(int newSelectedDrawer){
    selectedItemDrawer = newSelectedDrawer ;
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });


  }
}