import 'package:dio/dio.dart';

import '../coins_app/model/coins_model.dart';
import '../news_app/model/article.dart';

class ApiServices {
  Dio dio = Dio();

  Future<List<Article>> getNews({required String value}) async {
    Response response = await dio.get(
      "https://newsapi.org/v2/top-headlines?country=us&category=$value&apiKey=b051929dddce440594270b6a4611cff0",
    );
    Map<String, dynamic> json = response.data;
    List<Article> article = [];
    for (var item in json["articles"]) {
      article.add(
        Article(
          name: item["source"]["name"],
          author: item["author"],
          title: item["title"],
          description: item["description"],
          url: item["url"],
          urlToImage: item["urlToImage"],
          publishedAt: item["publishedAt"],
          content: item["content"],
        ),
      );
    }
    return article;
  }

  Future<List<CoinsModel>> getCoins() async {
    Response response = await dio.get(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&page=1&price_change_percentage=24h",
    );
    List<dynamic> json = response.data;
    List<CoinsModel> coins = [];
    for (var item in json) {
      coins.add(
        CoinsModel(
          name: item["name"],
          symbol: item["symbol"],
          image: item["image"],
          current_price: item["current_price"],
          price_change_percentage_24h: item["price_change_percentage_24h"],
        ),
      );
    }
    return coins;
  }
}
