import 'package:tradingapp/features/market_watch/domain/entities/stock.dart';

abstract class MarketWatchRepo {
  Stream<List<Stock>> getNseFutureMarketStream();
}
