class CoinsModel {
  final String name;
  final String symbol;
  final String image;
  final dynamic current_price;
  final dynamic price_change_percentage_24h;

  CoinsModel({
    required this.name,
    required this.symbol,
    required this.image,
    required this.current_price,
    required this.price_change_percentage_24h,
  });
}
