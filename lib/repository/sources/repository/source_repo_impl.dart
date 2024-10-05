import 'package:news_flutterproject/model/SourceResponse.dart';
import 'package:news_flutterproject/repository/sources/source_data_source.dart';
import 'package:news_flutterproject/repository/sources/source_repo.dart';

class SourceRepoImpl implements SourceRepo{
  SourceRemoteDataSource remoteDataSource;
  SourceRepoImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId,) {
   return remoteDataSource.getSources(categoryId);
  }
  
}