import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nse_future_event.dart';
part 'nse_future_state.dart';

class NseFutureBloc extends Bloc<NseFutureEvent, NseFutureState> {
  NseFutureBloc() : super(NseFutureInitial()) {
    on<NseFutureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
