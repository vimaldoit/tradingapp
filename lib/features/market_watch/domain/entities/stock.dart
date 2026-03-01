import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String expiryDate;
  final double price;
  final double percentageChange;
  final bool isPositive;
  final double lastBuyPrice;
  final double lastSellPrice;

  const Stock({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.expiryDate,
    required this.price,
    required this.percentageChange,
    required this.isPositive,
    required this.lastBuyPrice,
    required this.lastSellPrice,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        expiryDate,
        price,
        percentageChange,
        isPositive,
        lastBuyPrice,
        lastSellPrice,
      ];
}
