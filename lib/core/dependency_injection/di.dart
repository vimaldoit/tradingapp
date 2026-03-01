import 'package:get_it/get_it.dart';
import 'package:tradingapp/features/market_watch/data/datasource/market_data_source.dart';
import 'package:tradingapp/features/market_watch/data/repository/market_watch_repo_impl.dart';
import 'package:tradingapp/features/market_watch/domain/repository/market_watch_repo.dart';
import 'package:tradingapp/features/market_watch/domain/usecase/get_nse_future_usecase.dart';
import 'package:tradingapp/features/market_watch/presentation/bloc/nse_future/nse_future_bloc.dart';
import 'package:tradingapp/features/navigation/presentation/bloc/bottomnavigation_bloc.dart';

class AppContainer {
  static GetIt sl = GetIt.instance;

  static Future<void> init() async {
    sl.registerLazySingleton<MarketDataSource>(() => MarketDataSource());
    sl.registerLazySingleton<MarketWatchRepo>(() => MarketWatchRepoImpl(sl()));

    // Use Case
    sl.registerLazySingleton(() => GetNseFutureUsecase(sl()));

    sl.registerFactory(() => BottomnavigationBloc());
    sl.registerFactory(() => NseFutureBloc(sl()));
  }
}
