import 'package:flutter/material.dart';

import 'package:envirocar_flutter/pages/loginsignup/Signup.dart';
import 'package:envirocar_flutter/pages/loginsignup/components/CustomInputField.dart';
import 'package:envirocar_flutter/shared_components/BlueButton.dart';
import 'package:envirocar_flutter/theme/colors_cario.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: kToolbarHeight),
              width: double.infinity,
              color: CarioColors.blueDarkCario,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      'assets/images/img_envirocar_logo_white.png',
                      fit: BoxFit.scaleDown,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),

                  // text and password fields
                  CustomInputField(
                    hintText: "Username",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    validator: (val) {
                      if (val == "yeah")
                        return null;
                      else
                        return "type \"yeah\"";
                    },
                  ),
                  CustomInputField(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),

                  // login button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: BlueButton(
                      "Login",
                      () {
                        if (_formKey.currentState.validate())
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                      },
                    ),
                  ),

                  // spacing
                  SizedBox(height: 10),

                  // texts
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Do you do not have an account yet?",
                      style:
                          TextStyle(color: CarioColors.carioColorPrimaryDark),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text(
                        "Register here!",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
