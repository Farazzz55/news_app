import 'package:flutter/material.dart';
import 'package:news_flutterproject/AppColors.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';

class TabsItems extends StatelessWidget {
  final bool isSelected;
  final Sources sources;

  TabsItems({required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryLight,
          width: 2,
        ),
        color: isSelected ? AppColors.primaryLight : Colors.transparent,
      ),
      child: Center(
        child: Text(
          sources.name ?? '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: isSelected ? AppColors.whiteColor : AppColors.primaryLight,
          ),
        ),
      ),
    );
  }
}
