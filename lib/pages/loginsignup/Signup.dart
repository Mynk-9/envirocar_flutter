import 'package:envirocar_flutter/pages/loginsignup/components/CustomCheckbox.dart';
import 'package:flutter/material.dart';

import 'package:envirocar_flutter/pages/loginsignup/Signup.dart';
import 'package:envirocar_flutter/pages/loginsignup/components/CustomInputField.dart';
import 'package:envirocar_flutter/shared_components/BlueButton.dart';
import 'package:envirocar_flutter/theme/colors_cario.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
              child: Align(
                // Align widget added so that SingleChildScrollView expands to take full size of screen
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
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
                          "Sign Up",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),

                      // username, email etc fields
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
                        hintText: "E-Mail",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      CustomInputField(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      CustomInputField(
                        hintText: "Confirm Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),

                      // checkboxes
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            CustomCheckbox(
                              title: Flexible(
                                child: Text(
                                  "I acknowledge I have read and agree to enviroCar's Terms and Conditions",
                                ),
                              ),
                              validator: (check) {
                                if (check)
                                  return null;
                                else
                                  return "Check this.";
                              },
                            ),
                            CustomCheckbox(
                              title: Flexible(
                                child: Text(
                                  "I have taken note of the Privacy Statement.",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // login button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: BlueButton(
                          "Submit",
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
                          "Do you already have an account?",
                          style: TextStyle(
                              color: CarioColors.carioColorPrimaryDark),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Signin here!",
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
        ),
      ),
    );
  }
}
