import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:domain/palindrome_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.useCase}) : super(HomeInitialState()) {
    on<HomeInitialEvent>(_onInitial);
    on<CheckStringEvent>(_onCheckString);
  }

  final PalindromeUseCase useCase;

  void _onInitial(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState());
  }

  void _onCheckString(CheckStringEvent event, Emitter<HomeState> emit) {
    final result = useCase.isPalindrome(event.stringToCheck);
    emit(HomeLoadedState(result));
  }
}
