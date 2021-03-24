import 'dart:convert';

import 'package:http/http.dart' as http;

/// enviroCar server uses a REST API
///
/// Authentication happens by sending two headers (one for username, another
/// for password) along with the requests.

class Auth {
  static String _name = ""; // username
  static String _token = ""; // password

  // API endpoints
  static final String apiEndpointStable = "https://envirocar.org/api/stable";
  static final String apiEndpointDev = "https://envirocar.org/api/dev";

  Auth();

  /// Login to enviroCar server
  ///
  /// [username] and [password] when provided will be saved for the session and
  /// used. The function will essentially check if the username and password
  /// are correct.
  ///
  /// Returns:  [true] if login successful
  ///           [false] if login fails with given values
  static Future<bool> login(String username, String password) async {
    var uri = Uri.parse(apiEndpointStable + "/users/" + username);
    var headers = {"X-User": username, "X-Token": password};

    var res = await http.get(uri, headers: headers);
    final int statusCode = res.statusCode;

    if (statusCode != 200) return false;

    _name = username;
    _token = password;
    return true;
  }

  /// Signup to enviroCar server
  ///
  /// [username], [password], [email] must be provided. [agreeTnC] signifies
  /// agreement to the Terms and Conditions, [agreePrivacyStatement] signifies
  /// agreement to the Privacy Statement, both must be true.
  /// On successful signup the username and password would be saved for the
  /// session.
  ///
  /// Returns:  [true] if signup successful,
  ///           [false] otherwise.
  static Future<bool> signup(String username, String email, String password,
      bool agreeTnC, bool agreePrivacyStatement) async {
    // would not send request if not agreeded to terms and conditions and
    // privacy statement
    if (!agreeTnC || !agreePrivacyStatement) return false;

    var uri = Uri.parse(apiEndpointStable + "/users/");
    Map<String, dynamic> body = {
      "name": username,
      "mail": email,
      "token": password,
      "acceptedTerms": true,
      "acceptedPrivacy": true,
    };
    String encodedBody = json.encode(body);

    var res = await http.post(uri, body: encodedBody, headers: {"Content-Type": "application/json; charset=utf-8"});
    final int statusCode = res.statusCode;

    if (statusCode != 201) return false;

    _name = username;
    _token = password;
    return true;
  }
}
