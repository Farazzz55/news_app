import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/home_screen/tabs/tabs.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';

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
           title: Text('News App',style: GoogleFonts.exo(
             textStyle:Theme.of(context).textTheme.titleLarge
           ),),

         ),
         body:
         FutureBuilder<SourceResponse?>(future: ApiManager.getSource(),
             builder: (context,snapshot){
           if(snapshot.connectionState==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator(
               color: AppColors.primaryLight,
             ));
           }
           else if(snapshot.hasError){
             return Column(
               children: [
                 Text('Something went wrong'),
                 ElevatedButton(onPressed: (){
                   ApiManager.getSource();
                   setState(() {

                   });
                 }, child: Text('Try again'))
               ],
             );
           }
           if(snapshot.data!.status!='ok'){
             return Column(
               children: [
                 Text(snapshot.data!.message!),
                 ElevatedButton(onPressed: (){
                   ApiManager.getSource();
                   setState(() {

                   });
                 }, child: Text('Try again'))
               ],
             );

           }
           var sourceList=snapshot.data!.sources!  ;
           return Tabs(sourceList: sourceList);


             }),
       )
     ],

   );
  }
}