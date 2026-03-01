import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tradingapp/features/market_watch/domain/entities/stock.dart';
import 'package:tradingapp/features/market_watch/domain/usecase/get_nse_future_usecase.dart';

part 'nse_future_event.dart';
part 'nse_future_state.dart';

class NseFutureBloc extends Bloc<NseFutureEvent, NseFutureState> {
  final GetNseFutureUsecase _getNseFutureUsecase;
  StreamSubscription? _subscription;
  List<Stock> _allStocks = [];
  String _searchQuery = "";
  NseFutureBloc(this._getNseFutureUsecase) : super(NseFutureInitial()) {
    on<NseFutureEvent>((event, emit) {
      emit(NseFutureLoading());
      _subscription?.cancel();
      _subscription = _getNseFutureUsecase.execute().listen(
        (stocks) => add(UpdateNseFuture(stocks)),
      );
    });
    on<UpdateNseFuture>((event, emit) {
      _allStocks = event.stocks;
      _emitFilteredStocks(emit);
    });
    on<SearchNseFuture>((event, emit) {
      _searchQuery = event.query.toLowerCase();
      _emitFilteredStocks(emit);
    });
  }
  void _emitFilteredStocks(Emitter<NseFutureState> emit) {
    if (_searchQuery.isEmpty) {
      emit(NseFutureLoaded(_allStocks));
    } else {
      final filteredStocks = _allStocks
          .where((stock) => stock.name.toLowerCase().contains(_searchQuery))
          .toList();
      emit(NseFutureLoaded(filteredStocks));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
