import 'dart:async';
import 'dart:math';
import 'package:tradingapp/features/market_watch/data/model/stock_model.dart';

class MarketDataSource {
  final _controller = StreamController<List<StockModel>>.broadcast();
  final _random = Random();
  
  List<StockModel> _stocks = [
        StockModel(
      id: "6",
      name: "AXIS BANK - JULY 25",
      imageUrl: "assets/images/axisbankIcon.png",
      expiryDate: "31-07-2025",
      price: 1245.80,
      percentageChange: -0.15,
      isPositive: false,
      lastBuyPrice: 1247.00,
      lastSellPrice: 1245.80,
    ),
    StockModel(
      id: "1",
      name: "HDFC - JULY 25",
      imageUrl: "assets/images/hdfcIcon.png",
      expiryDate: "31-07-2025",
      price: 3426.03,
      percentageChange: -3.95,
      isPositive: false,
      lastBuyPrice: 3428.03,
      lastSellPrice: 3426.03,
    ),
    StockModel(
      id: "2",
      name: "RELIANCE - JULY 25",
      imageUrl: "assets/images/hdfcIcon.png", // Using existing icon as placeholder
      expiryDate: "31-07-2025",
      price: 2540.50,
      percentageChange: 1.25,
      isPositive: true,
      lastBuyPrice: 2542.00,
      lastSellPrice: 2540.50,
    ),
    StockModel(
      id: "3",
      name: "TCS - JULY 25",
      imageUrl: "assets/images/hdfcIcon.png",
      expiryDate: "31-07-2025",
      price: 3890.75,
      percentageChange: -0.45,
      isPositive: false,
      lastBuyPrice: 3892.00,
      lastSellPrice: 3890.75,
    ),
    StockModel(
      id: "4",
      name: "ICICI - JULY 25",
      imageUrl: "assets/images/icicbankIcon.png",
      expiryDate: "31-07-2025",
      price: 1120.30,
      percentageChange: 0.85,
      isPositive: true,
      lastBuyPrice: 1122.00,
      lastSellPrice: 1120.30,
    ),
    StockModel(
      id: "5",
      name: "INFY - JULY 25",
      imageUrl: "assets/images/hdfcIcon.png",
      expiryDate: "31-07-2025",
      price: 1650.00,
      percentageChange: 2.10,
      isPositive: true,
      lastBuyPrice: 1652.00,
      lastSellPrice: 1650.00,
    ),

  ];

  Stream<List<StockModel>> get marketStream => _controller.stream;

  MarketDataSource() {
    _startUpdates();
  }

  void _startUpdates() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      _stocks = _stocks.map((stock) {
        final fluctuation = (_random.nextDouble() * 2 - 1) * 0.005; // -0.5% to 0.5%
        final newPrice = stock.price * (1 + fluctuation);
        final change = (newPrice - stock.price) / stock.price * 100;
        
        return stock.copyWith(
          price: double.parse(newPrice.toStringAsFixed(2)),
          percentageChange: double.parse((stock.percentageChange + change).toStringAsFixed(2)),
          isPositive: change >= 0,
          lastBuyPrice: double.parse((newPrice + 2.0).toStringAsFixed(2)),
          lastSellPrice: double.parse(newPrice.toStringAsFixed(2)),
        );
      }).toList();
      
      _controller.add(_stocks);
    });
  }

  void dispose() {
    _controller.close();
  }
}
