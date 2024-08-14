import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';

class HomeDrawer extends StatelessWidget {
  static int categories =1;
  static int setting =2;

  Function onClickHomeDrawer;
  HomeDrawer({required this.onClickHomeDrawer}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.2,
        backgroundColor: AppColors.primaryLight,
        shape: ContinuousRectangleBorder(),
        title: Text('News App!' , style: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.titleLarge,
          fontWeight: FontWeight.bold
        ),),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                onClickHomeDrawer(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list ,size: 33,) ,
                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                  Text('Categories' , style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            InkWell(
              onTap: (){
                onClickHomeDrawer(setting);


              },
              child: Row(
                children: [
                  Icon(Icons.settings,size: 33, ) ,
                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                  Text('Settings' , style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
