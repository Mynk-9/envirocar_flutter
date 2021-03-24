import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField(
      {Key key,
      this.hintText = "Hint Text",
      this.prefixIcon,
      this.isPassword = false,
      this.validator,
      this.controller})
      : super(key: key);

  final String hintText;
  final Icon prefixIcon;
  final bool isPassword;
  final Function validator;
  final TextEditingController controller;

  @override
  CustomInputFieldState createState() => CustomInputFieldState(
      hintText, prefixIcon, isPassword, validator, controller);
}

class CustomInputFieldState extends State<CustomInputField> {
  CustomInputFieldState(this.hintText, this.prefixIcon, this.isPassword,
      this.validator, this.controller);

  final String hintText;
  final Icon prefixIcon;
  final bool isPassword;
  final Function validator;
  final TextEditingController controller;

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    var outlineBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(width: 0),
      borderRadius: BorderRadius.circular(100),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        // added the following two properties to increase privacy of username
        // and password
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        // obscure text only if field is of password type and password is not
        // visible
        obscureText: isPassword && !passwordVisible,

        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.all(0),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
          focusedBorder: outlineBorderStyle,
          enabledBorder: outlineBorderStyle,
          errorBorder: outlineBorderStyle,
          focusedErrorBorder: outlineBorderStyle,

          // if password then add the visibility icon

          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(() {
                    passwordVisible = !passwordVisible;
                  }),
                )
              : null,
        ),
      ),
    );
  }
}
