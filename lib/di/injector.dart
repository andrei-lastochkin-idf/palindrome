import 'package:presentation/di/injector.dart';
import 'package:data/di/injector.dart';
import 'package:domain/di/injector.dart';

void setupLocator() {
  initDataModule();
  initDomainModule();
  initPresentationModule();
}