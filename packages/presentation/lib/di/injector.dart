import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:get_it/get_it.dart';

import '../screen/home/bloc/home_bloc.dart';


void initPresentationModule() {
  final locator = GetIt.I;

  locator.registerFactory<HomeBloc>(
    () => HomeBloc(locator.get<PalindromeUseCase>()),
  );
}

