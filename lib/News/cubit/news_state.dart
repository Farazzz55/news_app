import '../../model/NewsResponse.dart';

abstract class NewsState{}
class SuccessState extends NewsState{
  List<News>newsList;
  SuccessState({required this.newsList});
}
class LoadingState extends NewsState{}
class ErrorState extends NewsState{
  String errorMessage;
  ErrorState({required this.errorMessage});
}