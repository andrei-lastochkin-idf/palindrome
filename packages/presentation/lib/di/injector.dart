import 'package:get_it/get_it.dart';

void initPresentationModule() {
  final locator = GetIt.I;

  locator.registerFactory<HomeBloc>(
    () => HomeBloc(locator.get<PalindromeUseCase>()),
  );
}
