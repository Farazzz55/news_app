import 'package:flutter/material.dart';

import 'package:news_flutterproject/model/SourceResponse.dart';
import 'package:news_flutterproject/tabs/tabs_item.dart';

import '../News/news_.dart';

class Tabs extends StatefulWidget{
  List <Sources> sourceList;


  Tabs({required this.sourceList});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                setState(() {
                 selectedIndex=index;
                });

              },
              isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs:widget.sourceList.map((source)=>TabsItems(
                    sources: source, isSelected: selectedIndex==widget.sourceList.indexOf(source))).toList()    ),
            Expanded(child: News(source: widget.sourceList[selectedIndex]))
          ],
        ));

  }
}