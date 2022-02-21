part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class CheckStringEvent extends HomeEvent {
  final String stringToCheck;

  CheckStringEvent(this.stringToCheck);
}
