import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  CategoryItem({required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color ,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight:Radius.circular(
              index % 2 != 0 ? 25 : 0
          ),
          bottomLeft: Radius.circular(
            index % 2 == 0 ? 25 : 0
          ),
        )

      ),
      child: Column(
        children: [
          Image.asset(category.imgPath , height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title,style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge
          ),)
        ],
      ),
    );
  }
}
