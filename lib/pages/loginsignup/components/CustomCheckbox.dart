import 'package:flutter/material.dart';

class CustomCheckbox extends FormField<bool> {
  CustomCheckbox({
    Widget title,
    FormFieldSetter<bool> onSaved,
    FormFieldValidator<bool> validator,
    bool initialValue = false,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<bool> state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: state.value,
                  onChanged: state.didChange,
                ),
                title,
                state.hasError
                    ? Builder(
                        builder: (BuildContext context) => Text(
                          state.errorText,
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      )
                    : Text(""),
              ],
            );
          },
        );
}

// thanks to https://stackoverflow.com/a/57897318/6262571
