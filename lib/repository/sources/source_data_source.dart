import 'package:news_flutterproject/model/SourceResponse.dart';

abstract class SourceRemoteDataSource{
  Future<SourceResponse?>getSources(String categoryId);
}
abstract class SourceOfflineDataSource{}
abstract class SourceCashingDataSource{}