part of 'nse_future_bloc.dart';

sealed class NseFutureState extends Equatable {
  const NseFutureState();
  
  @override
  List<Object> get props => [];
}

final class NseFutureInitial extends NseFutureState {}
