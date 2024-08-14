import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget{
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(30),
           child: CachedNetworkImage(
             width: double.infinity,
             height: MediaQuery.of(context).size.height*0.27,
             fit: BoxFit.fill,
             imageUrl: news.urlToImage??"",
             placeholder: (context, url) => Center(
                 child: CircularProgressIndicator(
                   color: AppColors.primaryLight,
                 ),
             ),
             errorWidget: (context, url, error) => Icon(Icons.error),
           ),

         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
         Text(news.author??'',style: GoogleFonts.poppins(
           textStyle: Theme.of(context).textTheme.titleSmall,
           color: AppColors.LightGreyColor
         ),),
         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
         Text(news.title??'',style: GoogleFonts.poppins(
             textStyle: Theme.of(context).textTheme.bodyMedium,
             color: AppColors.greyColor
         )),
         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
         Text(news.publishedAt??'',style: GoogleFonts.poppins(
             textStyle: Theme.of(context).textTheme.bodySmall,
             color: AppColors.LightGreyColor,
         ),textAlign: TextAlign.right,),

       ],
     ),

    );


  }

}