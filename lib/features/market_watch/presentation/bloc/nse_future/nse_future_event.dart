part of 'nse_future_bloc.dart';

sealed class NseFutureEvent extends Equatable {
  const NseFutureEvent();

  @override
  List<Object> get props => [];
}

class LoadNseFuture extends NseFutureEvent {}

class UpdateNseFuture extends NseFutureEvent {
  final List<Stock> stocks;
  const UpdateNseFuture(this.stocks);
  @override
  List<Object> get props => [stocks];
}

class SearchNseFuture extends NseFutureEvent {
  final String query;
  const SearchNseFuture(this.query);

  @override
  List<Object> get props => [query];
}
