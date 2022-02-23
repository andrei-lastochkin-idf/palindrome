import 'package:domain/usecase.dart';

class PalindromeUseCase implements UseCase<String, Future<bool>> {
  @override
  Future<bool> call(String params) async {
    await Future.delayed(const Duration(seconds: 3));

    final isPalindrome = params == params.split('').reversed.join('');

    return Future.value(isPalindrome);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
