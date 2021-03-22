import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField(
      {Key key, this.hintText = "Hint Text", this.prefixIcon, this.validator})
      : super(key: key);

  final String hintText;
  final Icon prefixIcon;
  final Function validator;

  @override
  CustomInputField_State createState() =>
      CustomInputField_State(hintText, prefixIcon, validator);
}

class CustomInputField_State extends State<CustomInputField> {
  CustomInputField_State(this.hintText, this.prefixIcon, this.validator);

  final String hintText;
  final Icon prefixIcon;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    var outlineBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(width: 0),
      borderRadius: BorderRadius.circular(100),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: TextFormField(
        validator: validator,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
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
        ),
      ),
    );
  }
}
