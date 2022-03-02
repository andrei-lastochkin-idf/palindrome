import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:get_it/get_it.dart';

void initDomainModule() {
  final locator = GetIt.I;

  locator.registerFactory(
    () => PalindromeUseCase(locator.get<INetworkRepository>()),
  );
}
