import 'package:flutter/material.dart';
import 'package:news_flutterproject/home_screen/News/news_.dart';
import 'package:news_flutterproject/home_screen/tabs/tabs_item.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';

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
                selectedIndex=index;
                setState(() {

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