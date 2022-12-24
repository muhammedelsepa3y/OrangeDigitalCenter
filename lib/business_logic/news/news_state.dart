part of 'news_cubit.dart';

@immutable
abstract class NewsState {}
class NewsInitialState extends NewsState {}
class NewsLoadingState extends NewsState {}
class NewsSuccessState extends NewsState {}
class NewsErrorState extends NewsState {}


