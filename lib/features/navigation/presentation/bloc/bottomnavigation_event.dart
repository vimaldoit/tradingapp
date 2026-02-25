part of 'bottomnavigation_bloc.dart';

sealed class BottomnavigationEvent extends Equatable {
  const BottomnavigationEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends BottomnavigationEvent {
  final int index;
  TabChanged(this.index);

  @override
  List<Object> get props => [index];
}
