class Validators {
  static bool isNumber(String value) {
    if (value.trim().isEmpty) {
      return false;
    }
    try {
      num.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
