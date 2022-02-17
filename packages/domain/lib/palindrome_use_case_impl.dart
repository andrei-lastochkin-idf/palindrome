library domain;

import 'package:domain/palindrome_use_case.dart';

class PalindromeUseCaseImpl implements PalindromeUseCase {
  @override
  bool isPalindrome(String rawString) {
    String text = rawString.toLowerCase().trim();
    String reversedText = text.split('').reversed.join('');

    if (text == reversedText) {
      return true;
    } else {
      return false;
    }
  }
}
