import 'package:news_flutterproject/model/SourceResponse.dart';

abstract class SourceRepo {
  Future<SourceResponse?>getSources(String categoryId);
}