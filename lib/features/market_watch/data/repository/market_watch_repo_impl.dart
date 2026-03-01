import 'package:tradingapp/features/market_watch/data/datasource/market_data_source.dart';
import 'package:tradingapp/features/market_watch/domain/entities/stock.dart';
import 'package:tradingapp/features/market_watch/domain/repository/market_watch_repo.dart';

class MarketWatchRepoImpl implements MarketWatchRepo {
  final MarketDataSource _dataSource;

  MarketWatchRepoImpl(this._dataSource);

  @override
  Stream<List<Stock>> getNseFutureMarketStream() {
    return _dataSource.marketStream;
  }
}
