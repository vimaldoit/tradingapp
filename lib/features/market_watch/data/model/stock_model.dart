import 'package:tradingapp/features/market_watch/domain/entities/stock.dart';

class StockModel extends Stock {
  const StockModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.expiryDate,
    required super.price,
    required super.percentageChange,
    required super.isPositive,
    required super.lastBuyPrice,
    required super.lastSellPrice,
  });

  StockModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? expiryDate,
    double? price,
    double? percentageChange,
    bool? isPositive,
    double? lastBuyPrice,
    double? lastSellPrice,
  }) {
    return StockModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      expiryDate: expiryDate ?? this.expiryDate,
      price: price ?? this.price,
      percentageChange: percentageChange ?? this.percentageChange,
      isPositive: isPositive ?? this.isPositive,
      lastBuyPrice: lastBuyPrice ?? this.lastBuyPrice,
      lastSellPrice: lastSellPrice ?? this.lastSellPrice,
    );
  }
}
