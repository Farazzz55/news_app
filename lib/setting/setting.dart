import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutterproject/AppColors.dart';

import 'language_bottom_sheet.dart';

class Setting extends StatefulWidget {

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(35),
          child: Text('Language' , style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold
            )
          ),),
        ),
        Center(
          child: InkWell(
            onTap: (){
              showLanguageBottomSheet();

            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.primaryLight
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('English', style: GoogleFonts.poppins(
                    textStyle:Theme.of(context).textTheme.titleMedium,
                    color: AppColors.primaryLight
                  ),),
                  Icon(Icons.arrow_drop_down, size: 30,color: AppColors.primaryLight,)
                ],
              ),
            ),
          ),
        )

      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=> LanguageBottomSheet());
  }
}
