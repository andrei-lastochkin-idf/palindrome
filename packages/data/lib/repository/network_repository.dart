import 'package:domain/model/palindrome_response.dart';
import 'package:domain/repository/network_repository.dart';

class NetworkRepository implements INetworkRepository {
  @override
  Future<PalindromeResponse> checkPalindrome(String string) async {
    await Future.delayed(const Duration(seconds: 3));

    //Response from server
    final isPalindrome = string == string.split('').reversed.join('');

    return Future.value(PalindromeResponse(isPalindrome));
  }
}
