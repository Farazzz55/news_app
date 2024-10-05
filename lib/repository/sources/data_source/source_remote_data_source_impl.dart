import 'package:news_flutterproject/api/api_manager.dart';
import 'package:news_flutterproject/model/SourceResponse.dart';
import 'package:news_flutterproject/repository/sources/source_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId)async {
    var response = await apiManager.getSource(categoryId);
    return response;
  }
  
}