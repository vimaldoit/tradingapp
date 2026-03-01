part of 'nse_future_bloc.dart';

sealed class NseFutureState extends Equatable {
  const NseFutureState();

  @override
  List<Object> get props => [];
}

final class NseFutureInitial extends NseFutureState {}

final class NseFutureLoading extends NseFutureState {}

final class NseFutureLoaded extends NseFutureState {
  final List<Stock> stocks;
  const NseFutureLoaded(this.stocks);

  @override
  List<Object> get props => [stocks];
}

final class NseFutureError extends NseFutureState {
  final String message;
  const NseFutureError(this.message);

  @override
  List<Object> get props => [message];
}
