part of 'coins_cubit.dart';

@immutable
sealed class CoinsState {}

final class CoinsInitial extends CoinsState {}

final class CoinsLoadingState extends CoinsState {}

final class CoinsSuccessState extends CoinsState {
  final List<CoinsModel> coins;

  CoinsSuccessState({required this.coins});
}

final class CoinsErrorState extends CoinsState {
  final String message;

  CoinsErrorState({required this.message});
}
