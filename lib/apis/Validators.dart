// validators for username, emails, passwords etc
// schema present in /lib/resources/schema

class Validator {
  static bool validateUsername(String username) {
    // regex picked from definitions.json schema
    RegExp regExp = new RegExp("^[_A-Za-z0-9-]{4,}\$");
    return regExp.hasMatch(username);
  }

  static bool validateEmail(String email) {
    // regex picked from definitions.json schema
    RegExp regExp = new RegExp(
        "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})\$");
    return regExp.hasMatch(email);
  }
}
