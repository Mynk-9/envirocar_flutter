import 'package:flutter/material.dart';

import 'package:envirocar_flutter/apis/Auth.dart';

import 'package:envirocar_flutter/pages/loginsignup/components/CustomInputField.dart';
import 'package:envirocar_flutter/pages/loginsignup/components/CustomCheckbox.dart';
import 'package:envirocar_flutter/shared_components/BlueButton.dart';
import 'package:envirocar_flutter/theme/colors_cario.dart';
import 'package:envirocar_flutter/apis/Validators.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Function signupHandler = (String username,
      String email,
      String password,
      bool agreeTnC,
      bool agreePS,
      GlobalKey<FormState> form,
      BuildContext _context) async {
    if (form.currentState.validate()) {
      if (await Auth.signup(username, email, password, agreeTnC, agreePS)) {
        ScaffoldMessenger.of(_context)
            .showSnackBar(SnackBar(content: Text('Signup successful. Please verify your email.')));
      } else {
        ScaffoldMessenger.of(_context)
            .showSnackBar(SnackBar(content: Text('Signup Failed')));
      }
    } else {
      ScaffoldMessenger.of(_context)
          .showSnackBar(SnackBar(content: Text('Invalid data entered')));
    }
  };

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

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
                        validator: (String val) {
                          val = val.trim();
                          if (Validator.validateUsername(val))
                            return null;
                          else
                            return "Enter valid username";
                        },
                        controller: usernameController,
                      ),
                      CustomInputField(
                        hintText: "E-Mail",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        validator: (String val) {
                          val = val.trim();
                          if (Validator.validateEmail(val))
                            return null;
                          else
                            return "Enter valid email";
                        },
                        controller: emailController,
                      ),
                      CustomInputField(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        isPassword: true,
                        controller: passwordController,
                      ),
                      CustomInputField(
                        hintText: "Confirm Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        isPassword: true,
                        validator: (String val) {
                          if (passwordController.text ==
                              passwordConfirmController.text)
                            return null;
                          else
                            return "Passwords don't match";
                        },
                        controller: passwordConfirmController,
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
                                  "I acknowledge I have read and agree to enviroCar's Terms and Conditions.",
                                ),
                              ),
                              validator: (check) {
                                if (check)
                                  return null;
                                else
                                  return "Please accept Terms and Conditions";
                              },
                            ),
                            CustomCheckbox(
                              title: Flexible(
                                child: Text(
                                  "I have taken note of the Privacy Statement.",
                                ),
                              ),
                              validator: (check) {
                                if (check)
                                  return null;
                                else
                                  return "Please accept Privacy Statement";
                              },
                            ),
                          ],
                        ),
                      ),

                      // login button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: BlueButton(
                          "Submit",
                          () => signupHandler(
                            usernameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text,
                            true,
                            true,
                            _formKey,
                            context,
                          ),
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
