part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccessState extends NewsState {
  final List<Article> article;

  NewsSuccessState({required this.article});
}

class NewsErrorState extends NewsState {
  final String message;

  NewsErrorState({required this.message});
}
