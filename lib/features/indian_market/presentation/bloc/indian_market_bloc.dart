import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'indian_market_event.dart';
part 'indian_market_state.dart';

class IndianMarketBloc extends Bloc<IndianMarketEvent, IndianMarketState> {
  IndianMarketBloc() : super(IndianMarketInitial()) {
    on<IndianMarketEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
