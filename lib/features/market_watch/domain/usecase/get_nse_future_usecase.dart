import 'package:tradingapp/features/market_watch/domain/entities/stock.dart';
import 'package:tradingapp/features/market_watch/domain/repository/market_watch_repo.dart';

class GetNseFutureUsecase {
  final MarketWatchRepo _repository;
  GetNseFutureUsecase(this._repository);

  Stream<List<Stock>> execute() {
    return _repository.getNseFutureMarketStream();
  }
}
