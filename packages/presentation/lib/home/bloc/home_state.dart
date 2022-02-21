part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {
  final String initialString = "Enter some string";
}

class HomeLoadedState extends HomeState {
  final bool isPalindrome;

  HomeLoadedState(this.isPalindrome);
}
