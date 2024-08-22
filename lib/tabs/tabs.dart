import 'package:flutter/material.dart';
import 'package:news_flutterproject/News/news_view_model.dart';

import 'package:news_flutterproject/model/SourceResponse.dart';
import 'package:news_flutterproject/tabs/tabs_item.dart';
import 'package:provider/provider.dart';

import '../News/news_.dart';

class Tabs extends StatefulWidget {
  final List<Sources> sourceList;

  Tabs({required this.sourceList});

  @override
  State<Tabs> createState() => _TabsState();

}

class _TabsState extends State<Tabs> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          return DefaultTabController(
            length: widget.sourceList.length,
            child: Column(
              children: [
                TabBar(
                  onTap: (index) {
                    viewModel.selectedIndex==index;
                  },
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabs: widget.sourceList.map((source) => TabsItems(
                    sources: source,
                    isSelected: viewModel.selectedIndex == widget.sourceList.indexOf(source),
                  )).toList(),
                ),
                Expanded(
                  child: News(source: widget.sourceList[viewModel.selectedIndex]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}