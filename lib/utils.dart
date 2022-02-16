class Utils {
  static bool isPalindrome(String str) {
    bool result = false;

    int reversedIndex = str.length - 1;

    for (int index = 0; index < str.length; index++) {
      if (str[index] == str[reversedIndex]) {
        result = true;
      } else {
        result = false;
      }

      reversedIndex--;

      if (reversedIndex == (str.length / 2).round() || result == false) {
        break;
      }
    }

    return result;
  }
}
