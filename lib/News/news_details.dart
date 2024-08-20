import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/News/news_item.dart';
import 'package:news_flutterproject/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget{
  static String routeName='NewsDetails';


  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {


  @override
  Widget build(BuildContext context) {
    var news= ModalRoute.of(context)!.settings.arguments as News ;
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
        ),
        Image.asset('assets/images/pattern.png' ,
          width: double.infinity ,
          height:  double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: AppColors.whiteColor
            ),
            title: Text(news.title??'' , style: GoogleFonts.exo(
              textStyle: Theme.of(context).textTheme.bodyLarge ,
            ),
              maxLines: 2,),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                NewsItem(news: news),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.description??'' ,style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyMedium ,
                      color: AppColors.greyColor
                  ),),
                ) ,
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     RichText(text: TextSpan(
                       text: 'View Full Article' , style:
                       GoogleFonts.poppins(
                           textStyle: Theme.of(context).textTheme.titleMedium,
                           color: AppColors.greyColor,
                           fontWeight: FontWeight.bold
                       ),  recognizer:  TapGestureRecognizer()..onTap = () {launchUrl(Uri.parse(news.url??''));})
                     ),
                      Icon(Icons.arrow_forward_rounded)

                    ]
                )
              ],
            ),
          ),
        ) ,

      ],

    );
  }

}