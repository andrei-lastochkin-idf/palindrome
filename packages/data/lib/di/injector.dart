import 'package:domain/repository/network_repository.dart';
import 'package:get_it/get_it.dart';
import '../repository/network_repository.dart';

void initDataModule() {
  final locator = GetIt.I;

  locator.registerFactory<INetworkRepository>(() => NetworkRepository());
}
