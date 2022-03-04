import 'package:domain/base/usecase.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PalindromeUseCase implements UseCase<String, Future<bool>> {
  final INetworkRepository _repo;

  PalindromeUseCase(this._repo);

  @override
  Future<bool> call(String params) async {
    final response = await _repo.checkPalindrome(params);

    return Future.value(response.isPalindrome);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
