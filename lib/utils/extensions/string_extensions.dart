extension StringExtensions on String {
  bool get isEmail {
    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,6}$').hasMatch(this)) {
      return true;
    }
    return false;
  }

  bool isBetween(int min, int max) {
    if (length >= min && length <= max) return true;
    return false;
  }
// to check the string is number
  bool get isInt {
    if (RegExp(r'^\d+$').hasMatch(this)) return true;
    return false;
  }
}
