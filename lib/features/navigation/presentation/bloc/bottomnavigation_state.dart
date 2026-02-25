part of 'bottomnavigation_bloc.dart';

class BottomnavigationState extends Equatable {
  final int index;
  const BottomnavigationState(this.index);

  @override
  List<Object> get props => [index];
}
