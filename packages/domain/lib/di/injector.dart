import 'package:get_it/get_it.dart';
import '../repository/network_repository.dart';
import '../usecase/palindrome_usecase.dart';

void initDomainModule() {
  final locator = GetIt.I;

  locator.registerFactory(
    () => PalindromeUseCase(GetIt.I.get<INetworkRepository>()),
  );
}
