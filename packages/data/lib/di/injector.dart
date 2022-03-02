import 'package:get_it/get_it.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:data/repository/network_repository.dart';

void initDataModule() {
  final locator = GetIt.I;

  locator.registerSingleton<INetworkRepository>(NetworkRepository());
}
