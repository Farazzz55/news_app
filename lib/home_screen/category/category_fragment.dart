import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/home_screen/category/category_item.dart';
import 'package:news_flutterproject/model/category.dart';

class CategoryFragment extends StatelessWidget{
  //business entertainment general health science sports technology
  List<CategoryModel> categoryList=[
    CategoryModel(id: 'sports', color: AppColors.redColor, title: 'Sports', imgPath: 'assets/images/sports.png'),
    CategoryModel(id: 'general', color: AppColors.blueColor, title: 'General', imgPath: 'assets/images/Politics.png'),
    CategoryModel(id: 'health', color: AppColors.pinkColor, title: 'Health', imgPath: 'assets/images/health.png'),
    CategoryModel(id: 'business', color: AppColors.orangeColor, title: 'Business', imgPath: 'assets/images/bussines.png'),
    CategoryModel(id: 'entertainment', color: AppColors.BabyblueColor, title: 'Entertainment', imgPath: 'assets/images/environment.png'),
    CategoryModel(id: 'science', color: AppColors.yellowColor, title: 'Science', imgPath: 'assets/images/science.png'),

  ];
   Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),

          Text('Pick your category\nof interest' , style: GoogleFonts.poppins(
        textStyle:Theme.of(context).textTheme.titleLarge,color: AppColors.midGreyColor ,
            fontWeight: FontWeight.bold
      ),) ,
          SizedBox(height:MediaQuery.of(context).size.height*0.04 ,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10)
                , itemBuilder: (context,index) {
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoryList[index]);

                    },
                      child: CategoryItem(category: categoryList[index], index: index));
            },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),

    );
  }

}