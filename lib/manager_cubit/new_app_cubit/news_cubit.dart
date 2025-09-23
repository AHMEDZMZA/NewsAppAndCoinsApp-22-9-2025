import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_coins_app_project/news_app/model/article.dart';
import 'package:news_app_coins_app_project/services/api_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  ApiServices apiServices = ApiServices();
  List<Article> article = [];
  String currentCategory = "General";

  NewsCubit() : super(NewsInitial());

  getArticle({required String value}) async {
    emit(NewsLoading());
    try {
      article = await apiServices.getNews(value: value);
      currentCategory = value;
      emit(NewsSuccessState(article: article));
    } catch (e) {
      emit(NewsErrorState(message: e.toString()));
    }
  }
}
