library domain;

import 'package:domain/palindrome_use_case.dart';

class PalindromeUseCaseImpl implements PalindromeUseCase {
  @override
  bool isPalindrome(String rawString) {
    bool result = false;

    String text = rawString.toLowerCase().trim();

    int reversedIndex = text.length - 1;

    for (int index = 0; index < text.length; index++) {
      if (text[index] == text[reversedIndex]) {
        result = true;
      } else {
        result = false;
      }

      reversedIndex--;

      if (reversedIndex == (text.length / 2).round() || result == false) {
        break;
      }
    }

    return result;
  }
}
