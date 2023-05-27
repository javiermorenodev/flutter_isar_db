class Validators {
  static bool validateEmail(String value) {
    var band = false;
    var reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty || value == null) {
      band = true;
    } else if (!reg.hasMatch(value)) {
      band = true;
    }

    if (band) {
      return false;
    }
    return true;
  }

  static bool validateText(String value) {
    if (value.isEmpty || value == null) {
      return false;
    }
    return true;
  }
}
