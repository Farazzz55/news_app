import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/home_screen/category/category_details.dart';
import 'package:news_flutterproject/home_screen/category/category_fragment.dart';
import 'package:news_flutterproject/home_screen/home_drawer.dart';
import 'package:news_flutterproject/home_screen/search/search_view.dart';
import 'package:news_flutterproject/model/category.dart';
import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import '../setting/setting.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  Sources ? source ;


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ? searchTerm;
  bool isSearching=false;
  TextEditingController searchController =TextEditingController();
  List<News> searchResults=[];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
        ),
        Image.asset(
          'assets/images/pattern.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: isSearching? searchAppBar(): appBar(),
          drawer: Drawer(
            child: HomeDrawer(onClickHomeDrawer: onClickDrawer),
          ),
            body: isSearching
                ? buildSearchResults()
                : selectedItemDrawer == HomeDrawer.setting
                ? Setting()
                : selectedCategory == null
                ? CategoryFragment(onCategoryClick: onCategoryClick)
                : CategoryDetails(category: selectedCategory!)

        )
      ],
    );
  }


  AppBar searchAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      leading: IconButton(
        onPressed: () {
          setState(() {
            isSearching = false;
            searchTerm = null;
            searchController.clear();
            searchResults = [];
          });
        },
        icon: Icon(Icons.clear, size: 35),
      ),
      title: TextField(
        style: TextStyle(color: AppColors.primaryLight),
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: AppColors.primaryLight),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: (value){
          if (value.isNotEmpty) {
            searchQuery(value,selectedCategory!.id!);
          }
        },
      ),

    );
  }

   appBar(){
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      title: Text(
        selectedItemDrawer == HomeDrawer.setting
            ? 'Settings'
            : selectedCategory == null
            ? 'NewsApp'
            : '${selectedCategory!.title}',
        style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge),
      ),
      actions: [
        if (selectedCategory != null)
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: IconButton(
              onPressed: () {
                isSearching=true;
                setState(() {


                });
              },
              icon: Icon(Icons.search),
              iconSize: 35,
            ),
          )
      ],
    );
   }
  CategoryModel? selectedCategory;

  void onCategoryClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {
    });
  }

  int selectedItemDrawer = HomeDrawer.categories;

  void onClickDrawer(int newSelectedDrawer) {
    selectedItemDrawer = newSelectedDrawer;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {
    });
  }

  void searchQuery(String query,String categoryId) async {
    var searchList = await ApiManager.searchList(query);
    setState(() {
      searchResults = searchList;
    });
  }

  Widget buildSearchResults() {
    return Column(
      children: [
        Expanded(
          child: searchResults.isEmpty
              ? Center(child: Text('No results found', style: TextStyle(color: Colors.white)))
              : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final result = searchResults[index];
              return SearchView(result: result);
            },
          ),
        ),
      ],
    );
  }

}


