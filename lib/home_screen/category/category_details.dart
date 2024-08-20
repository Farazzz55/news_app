import 'package:flutter/material.dart';
import 'package:news_flutterproject/home_screen/category/category_details_view_model.dart';
import 'package:news_flutterproject/model/category.dart';
import 'package:provider/provider.dart';
import '../../AppColors.dart';
import '../../api/api_manager.dart';
import '../../model/SourceResponse.dart';
import '../../tabs/tabs.dart';

class CategoryDetails extends StatefulWidget{
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> viewModel ,
    child:Consumer<CategoryDetailsViewModel>( // listen view model
        builder: (context , viewModel , child) {
          if(viewModel.errorMessage != null){
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(onPressed: (){
                  viewModel.getSources(widget.category.id);
                  setState(() {
                  });
                }, child: Text('Try again'))
              ],
            );
          }
          if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLight,
              ),
            );
          } else {
            return Tabs(sourceList: viewModel.sourcesList!);
          }

        })
      ,);













/*
    return  FutureBuilder<SourceResponse?>(future: ApiManager.getSource(widget.category.id),
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
                  ApiManager.getSource(widget.category.id);
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
                  ApiManager.getSource(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try again'))
              ],
            );

          }
          var sourceList=snapshot.data!.sources!  ;
          return Tabs(sourceList: sourceList);
        });
*/

  }
}