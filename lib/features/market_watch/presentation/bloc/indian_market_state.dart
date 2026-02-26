part of 'indian_market_bloc.dart';

sealed class IndianMarketState extends Equatable {
  const IndianMarketState();
  
  @override
  List<Object> get props => [];
}

final class IndianMarketInitial extends IndianMarketState {}
