import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc
    extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  BottomnavigationBloc() : super(BottomnavigationState(2)) {
    on<TabChanged>((event, emit) {
      emit(BottomnavigationState(event.index));
    });
  }
}
