import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutterproject/home_screen/category/cubit/source_state.dart';

import 'package:news_flutterproject/model/category.dart';

import '../../AppColors.dart';
import '../../api/api_manager.dart';
import '../../model/SourceResponse.dart';
import '../../tabs/tabs.dart';
import 'cubit/category_details_view_model.dart';

class CategoryDetails extends StatefulWidget{
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  @override
  void initState() {
    viewModel.getSources(widget.category.id);
  }
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>viewModel,
      child: BlocBuilder<CategoryDetailsViewModel,SourceState>(
          builder: (context , state){
            if(state is SourceLoadingState){
              return Center(child: CircularProgressIndicator(
                color: AppColors.primaryLight,
              ));
            } else if(state is SourceErrorState){
              return Column(
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(onPressed: (){
                    viewModel.getSources(widget.category.id);
                    setState(() {
                    });
                  }, child: Text('Try again'))
                ],
              );
            } else if (state is SourceSuccessState){
            var sourceList=state.sourcesList  ;
            return Tabs(sourceList: sourceList);

          } else{
              return Center(child: CircularProgressIndicator(
                color: AppColors.primaryLight,
              ));
            }


          }),
    );


  }
}



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