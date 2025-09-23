import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_coins_app_project/services/api_services.dart';
import '../../coins_app/model/coins_model.dart';

part 'coins_state.dart';

class CoinsCubit extends Cubit<CoinsState> {
  CoinsCubit() : super(CoinsInitial());
  ApiServices apiServices = ApiServices();
  List<CoinsModel> coins = [];

  getCoins() async {
    emit(CoinsLoadingState());
    try {
      coins = await apiServices.getCoins();
      emit(CoinsSuccessState(coins: coins));
    } catch (e) {
      emit(CoinsErrorState(message: e.toString()));
    }
  }
}
